module.exports = Ember.View.extend

  templateName: 'upload/index'

  dragOver: (evt) ->
    evt.stopPropagation()
    evt.preventDefault()

    evt.dataTransfer.effect = 'link'
    console.log evt

  drop: (evt) ->
    evt.stopPropagation()
    evt.preventDefault()

    files = evt.dataTransfer.files
    console.log files
