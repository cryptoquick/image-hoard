App = Ember.Application.create()

App.Router.map ->
  @resource 'upload',
    path: '/upload'
  @resource 'gallery',
    path: '/gallery'

App.IndexRoute = require('./route.coffee')

App.UploadRoute = require('./upload/route.coffee')
App.UploadView = require('./upload/view.coffee')

App.GalleryView = require('./gallery/view.coffee')
