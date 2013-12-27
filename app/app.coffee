App = Ember.Application.create()

App.Router.map ->
  @resource 'upload',
    path: '/upload'
  @resource 'gallery',
    path: '/gallery'

# Models
App.Image = require('./models/image.coffee')

# Index
App.IndexRoute = require('./route.coffee')

# Upload
# App.UploadRoute = require('./upload/route.coffee')
App.UploadController = require('./upload/controller.coffee')
App.UploadView = require('./upload/view.coffee')

# Gallery
App.GalleryView = require('./gallery/view.coffee')
