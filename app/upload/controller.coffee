module.exports = Ember.Controller.extend
  
  actions:

    addImage: (file, data) ->
      result = data.target.result

      image =
        id: SparkMD5.hash result
        name: file.name
        'date-modified': new Date file.lastModifiedDate
        'date-added': new Date()
        size: file.size
        type: file.type.split('image/')[1]
