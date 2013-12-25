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
          livereload: yes

      templates:
        files: ['app/**/*.emblem']
        tasks: ['emblem']
        options:
          atBegin: yes
          livereload: yes

      scripts:
        files: ['app/**/*.coffee']
        tasks: ['browserify']
        options:
          atBegin: yes
          livereload: yes

    concat:

      install:
        src: [
          'lib/jquery/jquery.js'
          'lib/handlebars/handlebars.js'
          'lib/ember/ember.js'
          'lib/emblem/dist/emblem.js'
          'lib/ember-data/ember-data.js'
          'lib/pouchdb/dist/pouchdb-nightly.js'
          'lib/spark-md5/spark-md5.js'
        ]
        dest: 'public/<%= pkg.name %>.lib.js'

    browserify:

      default:
        files:
          'public/<%= pkg.name %>.app.js': ['app/app.coffee']
        options:
          transform: ['coffeeify']

    clean: ['public']

    stylus:

      default:
        files:
          'public/<%= pkg.name %>.css': ['styles/*.styl', 'styles/**/*.styl']
        options:
          compress: no

    emblem:

      default:
        files:
          'public/<%= pkg.name %>.tpl.js': 'app/**/*.emblem'
        options:
          root: 'app/'
          dependencies:
            jquery: 'lib/jquery/jquery.js'
            ember: 'lib/ember/ember.js'
            emblem: 'lib/emblem/dist/emblem.js'
            handlebars: 'lib/handlebars/handlebars.js'

    copy:
      default:
        files: [
          src: 'index.html'
          dest: 'public/index.html'
        ]

    # nodewebkit:
    #
    #   options:
    #     build_dir: 'build'
    #     mac: yes
    #     version: '0.8.2'

  grunt.loadNpmTasks task for task of pkg.devDependencies when task.indexOf('grunt') is 0 and task isnt 'grunt'
  
  grunt.registerTask 'install', [
    'bower_install'
    'concat:install'
    'copy'
  ]

  grunt.registerTask 'default', [
    'browserify'
    'stylus'
    'emblem'
  ]

  return
