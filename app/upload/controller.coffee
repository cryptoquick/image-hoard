module.exports = Ember.Controller.extend
  
  actions:
    addImage: (file, data) ->
      console.log 'files!', file, data, data.target
      result = data.target.result
      image = 
        name: file.name
        date: file.lastModifiedDate ? 0
        size: file.size
        type: file.type.split('image/')[1]
        hash: SparkMD5.hash result
      console.log image
