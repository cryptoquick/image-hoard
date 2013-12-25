module.exports = Ember.View.extend

  templateName: 'upload/index'

  dragOver: (evt) ->
    evt.stopPropagation()
    evt.preventDefault()

    evt.dataTransfer.effect = 'link'
    # console.log evt

  drop: (evt) ->
    evt.stopPropagation()
    evt.preventDefault()

    files = evt.dataTransfer.files

    that = this

    for file in files
      if file.type.match 'image.*'
        do (file) ->
          reader = new FileReader()
          reader.onload = (data) ->
            that.get('controller').send('addImage', file, data);
          reader.readAsDataURL file

    console.log files
