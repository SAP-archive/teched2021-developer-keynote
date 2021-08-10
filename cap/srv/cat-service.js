const cds = require('@sap/cds')
module.exports = async (srv) => { 
    const ECPersonalInformation = await cds.connect.to('ECPersonalInformation')
    const { PerPersonalExt } = ECPersonalInformation.entities
    const { PerPersonal } = srv.entities

    srv.on(['READ'], PerPersonal, async (req) => {
        const PerPersonalQuery = SELECT.from(PerPersonalExt)
            .where(req.query.SELECT.where)
            .limit(req.query.SELECT.limit)
            .orderBy(req.query.SELECT.orderBy)

        let personals = await ECPersonalInformation.tx(req).send({
            query: PerPersonalQuery,
            headers: { APIKey: process.env.APIKey }
        })

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
        return personalsWithExtension
    })
}