window.App = App = Ember.Application.create()

App.Router.map ->
  @resource 'gallery',
    ->
      @resource 'upload',
      ->

# Models
App.Image = require './models/image.coffee'

# Adapters
App.ImageAdapter = require './adapters/image.coffee'

# Serializers
App.ImageSerializer = require './serializers/image.coffee'

# Index
App.IndexRoute = require './route.coffee'

# Gallery
App.GalleryRoute = require './gallery/route.coffee'
# App.GalleryController = require './gallery/controller.coffee' 
App.GalleryView = require './gallery/view.coffee'

# Upload
# App.UploadRoute = require './upload/route.coffee' 
App.UploadController = require './upload/controller.coffee' 
App.UploadView = require './upload/view.coffee'
