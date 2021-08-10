require('dotenv').config()
const cds = require('@sap/cds')

cds.on('bootstrap', app => {
    app.get('/health', (_, res) => {
        res.status(200).send('OK')
    })
})

module.exports = cds.server