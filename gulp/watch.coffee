'use strict'

$ = require
path = $ 'path'
gulp = $ 'gulp'
conf = $ './conf'

browserSync = require 'browser-sync'

isOnlyChange = (event) -> event.type == 'changed'

gulp.task 'watch', [
  'pages'
], ->

  gulp.watch 'src/demo/**/*.jade', [ 'pages' ]

  gulp.watch '.tmp/app/*.html', (event) ->
    console.log event
    # setTimeout ->
    browserSync.reload event.path
    # , 350
    return
  return
