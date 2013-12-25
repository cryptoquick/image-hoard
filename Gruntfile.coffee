module.exports = (grunt) ->

  pkg = grunt.file.readJSON 'package.json'

  grunt.initConfig

    pkg: pkg

    watch:

      css:
        files: ['styles/**/*.styl']
        tasks: ['stylus']
        options:
          atBegin: yes

      templates:
        files: ['app/**/*.jade', '!app/app.jade']
        tasks: ['jade:default']
        options:
          atBegin: yes

      scripts:
        files: ['app/app.coffee']
        tasks: ['browserify']
        options:
          atBegin: yes

      livereload:
        files: ['app/**/*', 'styles/**/*']
        options:
          livereload: yes

    concat:
      install:
        src: [
          'lib/jquery/jquery.js'
          'lib/handlebars/handlebars.js'
          'lib/ember/ember.js'
          'lib/ember-data/ember-data.js'
          'lib/pouchdb/dist/pouchdb-nightly.js'
          'lib/quojs/quo.js'
        ]
        dest: 'public/<%= pkg.name %>.lib.js'

    browserify:
      default:
        files:
          'public/<%= pkg.name %>.js': ['app/app.coffee']
        options:
          transform: ['coffeeify']

    clean: ['public']

    stylus:
      default:
        files:
          'public/<%= pkg.name %>.css': ['styles/*.styl', 'styles/**/*.styl']
        options:
          compress: no

    # nodewebkit:
    #   options:
    #     build_dir: 'build'
    #     mac: yes
    #     version: '0.8.2'

  grunt.loadNpmTasks task for task of pkg.devDependencies when task.indexOf('grunt') is 0 and task isnt 'grunt'
  
  grunt.registerTask 'install', [
    'bower_install'
    'concat:install'
  ]
  grunt.registerTask 'default', [
    'clean'
    'browserify'
    'stylus'
    'jade:default'
  ]

  return
