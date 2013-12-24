App:
  Router:
    Backbone.Router.extend
      routes:
        'upload': 'upload'

      upload: ->
        view = new App.Upload.View
        view.render

  Upload: require './upload/index.coffee'

Backbone.history.start
  pushState: yes
