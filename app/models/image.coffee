attr = DS.attr

module.exports = DS.Model.extend

  name: attr 'string'
  'date-modified': 'date'
  'date-added': 'date'
  size: 'number'
  type: 'string'
