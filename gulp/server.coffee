'use strict'

$ = require
path = $ 'path'
gulp = $ 'gulp'
conf = $ './conf'

browserSync = $ 'browser-sync'
browserSyncSpa = $ 'browser-sync-spa'

browserSyncInit = (baseDir, browser) ->
  browserSync.instance = browserSync.init(
    startPath: '/index.html'
    server:
      baseDir: baseDir
      routes: '/bower_components': 'bower_components'
    browser: conf.browser
  )
  return

browserSync.use browserSyncSpa selector: '[ng-app]'

gulp.task 'serve', [ 'watch' ], ->
  browserSyncInit [ '.tmp', 'src' ]
