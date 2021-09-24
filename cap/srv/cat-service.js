const cds = require('@sap/cds')
module.exports = async (srv) => {
    const ECPersonalInformation = await cds.connect.to('ECPersonalInformation')
    const { PerPersonalExt } = ECPersonalInformation.entities
    const { PerPersonal } = srv.entities

    srv.on(['READ'], PerPersonal, async (req) => {

        let PerPersonalCountQuery = SELECT`COUNT(*) as COUNT`.from(PerPersonalExt)
            .where(req.query.SELECT.from.ref[0].where || req.query.SELECT.where)

        let PerPersonalQuery = SELECT.from(PerPersonalExt)
            .where(req.query.SELECT.from.ref[0].where || req.query.SELECT.where)
            .limit(req.query.SELECT.limit)
        if (req.query.SELECT.orderBy) {
            PerPersonalQuery.orderBy(req.query.SELECT.orderBy)
        }


        let [personals, count] = [null, null]
        if (req.query.SELECT.count) {
            [personals, count] = await Promise.all([
                ECPersonalInformation.tx(req).send({
                    query: PerPersonalQuery,
                    headers: { APIKey: process.env.APIKey }
                }),
                ECPersonalInformation.tx(req).send({
                    query: '/PerPersonal?$count=true&$top=1&$inlinecount=allpages',
                    headers: { APIKey: process.env.APIKey }
                })
            ])
        }
        else {
            personals = await ECPersonalInformation.tx(req).send({
                query: PerPersonalQuery,
                headers: {
                    APIKey: process.env.APIKey, $count: true,
                    $inlinecount: 'allpages'
                },

            })
        }


        const getExtensionData = personals.map(async (item) => {
            const data = await SELECT.from(PerPersonal).where({ id: item.id })
            if (data[0]) {
                item.middelName = data[0].middelName
            } else {
                item.middelName = null
            }
            return item
        })
        const personalsWithExtension = await Promise.all(getExtensionData)
        if (req.query.SELECT.count) {
            if (personalsWithExtension.length < 30) { personalsWithExtension['$count'] = personalsWithExtension.length } else { personalsWithExtension['$count'] = 1_000 }
        }
        return personalsWithExtension
    })
}