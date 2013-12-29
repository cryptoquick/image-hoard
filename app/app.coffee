App = Ember.Application.create()

App.Router.map ->
  @resource 'gallery',
    ->
      @resource 'upload',
      ->

# Models
App.Image = require './models/image.coffee'

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
