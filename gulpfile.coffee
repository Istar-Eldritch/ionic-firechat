gulp      = require 'gulp'
gutil     = require 'gulp-util'
bower     = require 'bower'
concat    = require 'gulp-concat'
sass      = require 'gulp-sass'
minifyCss = require 'gulp-minify-css'
minifyJS  = require 'gulp-uglify'
rename    = require 'gulp-rename'
sh        = require 'shelljs'
coffee    = require 'gulp-coffee'
karma     = require('karma').server

paths =
  sass: ['./scss/**/*.scss']
  coffee: ['./coffee/**/*.coffee']

gulp.task 'default', ['install']

gulp.task 'sass', ->
  gulp.src('./scss/ionic.app.scss')
    .pipe sass()
    .pipe gulp.dest('./www/css/')
    .pipe minifyCss keepSpecialComments: 0
    .pipe rename extname: '.min.css'
    .pipe(gulp.dest('./www/css/'))

gulp.task 'coffee', ->
  gulp.src paths.coffee
    .pipe coffee()
    .pipe concat 'app.js'
    .pipe gulp.dest './www/js/'
    .pipe minifyJS()
    .pipe rename extname: '.min.js'
    .pipe gulp.dest './www/js/'

gulp.task 'test', (done) ->
  karma.start
      configFile: __dirname + '/karma.conf.js'
      singleRun: true
    done

gulp.task 'watch', ->
  gulp.watch paths.sass, ['sass']
  gulp.watch paths.coffee, ['coffee']

gulp.task 'install', ['git-check','sass','coffee'], ->
  bower.commands.install().on 'log', (data) ->
    gutil.log('bower', gutil.colors.cyan(data.id), data.message)

gulp.task 'git-check', (done) ->
  if not sh.which('git')
    console.log '  ' + gutil.colors.red('Git is not installed.')
    process.exit(1)
  done()