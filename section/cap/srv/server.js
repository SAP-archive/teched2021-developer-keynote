const cds = require('@sap/cds')
const cors = require('cors')
const proxy = require('@sap/cds-odata-v2-adapter-proxy')

cds.on('bootstrap', app => {
    app.use(proxy())
    app.use(cors()) 
    app.get('/health', (_, res) => {
        res.status(200).send('OK')
    })
})

if (process.env.NODE_ENV !== 'production') {
    require('dotenv').config()
    const cds_swagger = require('cds-swagger-ui-express')
    cds.on('bootstrap', app => app.use(cds_swagger()))
}

module.exports = cds.server