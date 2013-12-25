App = Ember.Application.create()

App.Router.map ->
  @resource 'upload',
    path: '/upload'
    ->
