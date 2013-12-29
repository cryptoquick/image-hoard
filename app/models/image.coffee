module.exports = DS.Model.extend

  name: DS.attr 'string'
  'date-modified': DS.attr 'date'
  'date-added': DS.attr 'date'
  size: DS.attr 'number'
  type: DS.attr 'string'
  url: DS.attr 'string'
