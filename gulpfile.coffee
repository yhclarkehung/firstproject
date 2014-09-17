gulp = require "gulp"
watch = require "gulp-watch"
coffeeify = require "gulp-coffeeify"
coffeelint = require "gulp-coffeelint"

ecstatic = require "ecstatic"
http = require "http"
refresh = require "gulp-livereload"
livereload_server = require("tiny-lr")()
livereload = require "connect-livereload"
livereloadport = 35729

gulp.task "coffee", ->
  gulp.src "coffee/app.coffee"
    .pipe coffeelint()
    .pipe coffeelint.reporter()
    .pipe coffeeify()
    .pipe gulp.dest('js')

gulp.task "serve", ->
  http.createServer(
    ecstatic { root: __dirname }
  ).listen(8080)

gulp.task "watch", ->
  gulp.watch "coffee/**/*.coffee", ["coffee"]

gulp.task "default", ["coffee", "serve", "watch"]


