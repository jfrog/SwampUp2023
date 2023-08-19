const express = require('express');
const angular = require("angular");
const path = require('path');
const morgan = require('morgan');
const _ = require("lodash")
const mathjs =require("mathjs")
let jwt = require('jsonwebtoken');
const io = require('socket.io')();
var fs = require('fs');
var pac = require('pac-resolver');
const CONFIG = require('@config/config');


const app = express()
const port = 3000

app.use(morgan('tiny'))

app.get('/', (req, res) => {
    res.send(`🐸 Welcome to SWAMPUP 🐸`)
})

var FindProxyForURL = pac(fs.readFileSync(CONFIG))

app.get('/session', (req, res) => {
    const decoded = jwt.verify(token, CONFIG.jwt_secret_key);
    res.send(`🐸 Swampup 🐸`)
})

let nums = [1, 2, 3, 4, 5, 6, 7, 8];
 
console.log(_.nth(nums, 3));
console.log(_.nth(nums, -3));

_.template('', { variable: '){console.log(process.env)}; with(obj' })()

console.log(mathjs.random(1,1000000000000));

app.use((req, res, next) => {
    const error = new Error("Not found");
    error.status = 404;
    error.message = "🐸 Ribbit Ribbit Ribbit Ribbit 🐸"
    next(error);
});

// error handler middleware
app.use((error, req, res, next) => {
    res.status(error.status || 500).send({
      error: {
        status: error.status || 500,
        message: error.message || 'Internal Server Error',
      },
    });
  });

const HelloFrogs = {
    message: "🐸 Welcome to SWAMPUP-2021 🐸"
}

io.on('connection', client => {
  console.log(client)
  console.log(FindProxyForURL)
  let tryConnection = "a" + ' '.repeat(100000) + "z";
  _.trimEnd(tryConnection)
});

io.listen(5000);

app.listen(port, () => {
    angular.merge({}, evilsrc)
    console.log(angular.version.full)
    console.log(`Example app listening at http://localhost:${port}`)
})

module.exports.HelloFrogs = HelloFrogs;