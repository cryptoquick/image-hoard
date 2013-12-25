App:
  Upload: require './upload/upload.coffee'

  Router:
    Backbone.Router.extend
      routes:
        'upload': 'upload'

      upload: ->
        view = new App.Upload.View
        view.render

Backbone.history.start
  pushState: yes
