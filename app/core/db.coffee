db = new PouchDB 'dbname'
remote = 'https://ndeelistalethetheractied:HyxYaKHIEom7dUEi4221QgXC@cryptoquick.cloudant.com/dragon'
opts = 
  continuous: true

db.replicate.to remote, opts
db.replicate.from remote, opts
