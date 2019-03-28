const express = require('express')
const app = express()

const api = require('./api')
api(app)

app.listen(5000)

console.log('Server running at port 5000');