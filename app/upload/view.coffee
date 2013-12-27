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

    addImage = ->
      return new Ember.RSVP.Promise (resolve, reject) ->
        reader = new FileReader()
        reader.onload = (data) ->
          result = data.target.result

          image = that.get('controller').store.push 'image',
            id: SparkMD5.hash result
            name: file.name
            'date-modified': new Date file.lastModifiedDate
            'date-added': new Date()
            size: file.size
            type: file.type.split('image/')[1]

          console.log 'loaded'
          resolve image
        reader.onerror = (evt) ->
          reject evt
        reader.readAsDataURL file

    promises = (addImage file for file in files when file.type.match 'image.*')

    Ember.RSVP.all(promises).then (results) ->
      console.log 'finished! results', results

    console.log files
