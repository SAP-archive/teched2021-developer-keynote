const cds = require('@sap/cds')
module.exports = async (srv) => {
    const ECPersonalInformation = await cds.connect.to('ECPersonalInformation')
    const { PerPersonal } = srv.entities

    srv.on(['READ'], PerPersonal, async (req) => {
        //Work around that's no longer needed in CAP 5.6 and higher
/*          if (req.query.SELECT.from.ref[0].where){
            req.query.SELECT.from.ref[0].where[6].val += 'T00:00:00'
        }  */
        let PerPersonalQuery = SELECT.from(req.query.SELECT.from)
            .limit(req.query.SELECT.limit)
        if (req.query.SELECT.where) {
            PerPersonalQuery.where(req.query.SELECT.where)
        }
        if (req.query.SELECT.orderBy) {
            PerPersonalQuery.orderBy(req.query.SELECT.orderBy)
        }

        let personal = await ECPersonalInformation.tx(req).send({
            query: PerPersonalQuery,
            headers: {
                APIKey: process.env.APIKey
            }
        })
        let personals = []
        if (Array.isArray(personal)){
            personals = personal
        }else {personals[0] = personal}

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