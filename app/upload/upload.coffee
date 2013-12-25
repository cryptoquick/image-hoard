module.exports = 
  View: Backbone.View.extend
    el: '#drop'
    render: ->
      @$el.html App.Templates['app/upload/index']()
