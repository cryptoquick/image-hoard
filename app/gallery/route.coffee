module.exports = Ember.Route.extend
  actions:
    update: ->
      console.log 'finding model~!'
      @findModel 'image'
