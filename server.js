var http = require('http');
var url = require('url');
var fs = require('fs');
var addon = require('./build/Release/addon');

var newPostFormHTML = fs.readFileSync('views/calc.html');

function renderNewPostForm(request, response) {
    response.writeHead(200, {
        'Content-type': 'text/html; charset=utf-8'
    });
    response.end(request + newPostFormHTML);
}

function render404(request, response) {
    response.writeHead(404);
    response.end('404 File not found');
}

var server = http.createServer(function(request, response) {
    var newPostFormRegex = new RegExp('^/calc/?$');
    var pathname = url.parse(request.url).pathname;
    if (newPostFormRegex.test(pathname)) {
        var rez = addon.add(3,5);
        renderNewPostForm(rez, response);
    } else {
        render404(request, response);
    }
});

server.listen(8000);

console.log('Listening on http://127.0.0.1:8000');