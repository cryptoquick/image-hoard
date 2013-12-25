module.exports = Ember.Route.extend

  renderTemplate: ->
    @_super this

    @render 'upload',
      outlet: 'upload'
      into: 'index'
      controller: 'upload'

    @render 'gallery',
      outlet: 'gallery'
      into: 'index'
