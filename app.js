const connect = require('gulp-connect')
const fs = require('fs');

var port = process.env.PORT || 3000;
var host = process.env.HOST || "localhost";

connect.server({
    root: 'root',
    port: port,
    host: host
})

