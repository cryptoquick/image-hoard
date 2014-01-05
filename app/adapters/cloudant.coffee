get = Ember.get
set = Ember.set

module.exports = DS.RESTAdapter.extend
  
  host: ''

  buildURL: (type, id) ->
    url = []
    host = get this, 'host'
    prefix = this.urlPrefix()

    if type
      url.push this.pathForType(type)

    if id
      url.push id

    if prefix
      url.unshift prefix

    url = url.join '/'

    return url;
