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

    browserify:
      default:
        files:
          'public/<%= pkg.name %>.js': ['app/app.coffee']
        options:
          transform: ['coffeeify']

    stylus:
      default:
        files:
          'public/<%= pkg.name %>.css': ['styles/*.styl', 'styles/**/*.styl']
        options:
          compress: no

    jade:
      default:
        files:
          'public/<%= pkg.name %>-templates.js': ['app/**/*.jade', '!app/app.jade']
        options:
          client: yes
          compileDebug: no
          namespace: 'app.templates'
          
      install:
        files:
          'public/<%= pkg.name %>.html': 'app/app.jade'
        options:
          pretty: yes
          data:
            pkg: pkg

    # nodewebkit:
    #   options:
    #     build_dir: 'build'
    #     mac: yes
    #     version: '0.8.2'

  grunt.loadNpmTasks task for task of pkg.devDependencies when task.indexOf('grunt') is 0 and task isnt 'grunt'
  
  grunt.registerTask 'install', ['jade:install']
  grunt.registerTask 'default', ['browserify', 'stylus', 'jade:default']

  return
