module.exports = Ember.Route.extend

  renderTemplate: ->
    @_super this

    @render 'upload',
      outlet: 'upload'
      into: 'index'

    @render 'gallery',
      outlet: 'gallery'
      into: 'index'
