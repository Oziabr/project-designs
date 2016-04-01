'use strict'

$ = require
path = $ 'path'
gulp = $ 'gulp'
conf = $ './conf'

# console.log 'plugins', conf.plugins.del, (require 'gulp-load-plugins')().del

gulp.task 'pages', [ 'bower' ], ->
  gulp.src [ '!src/demo/{mixin,layout}.jade', 'src/demo/**/*.jade' ]
  .pipe $('gulp-consolidate') 'jade', basedir: 'src', doctype: 'html', pretty: '  '
  .on 'error', conf.errorHandler 'Jade'
  .pipe    $('gulp-rename') (path) -> path.extname = '.html'
  .pipe gulp.dest '.tmp'
  .pipe conf.bSync.stream()

gulp.task 'bower', [], ->
  gulp.src 'src/demo/layout.jade'
  .pipe $('wiredep').stream $('lodash').extend {}, directory: 'bower_components'
  .pipe gulp.dest 'src/demo'

gulp.task 'clean', ->
  $('del') [ 'demo', '.tmp' ]
