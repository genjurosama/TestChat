@colClientNotes = new Mongo.Collection 'clientNotes'
@colClientFiles = new Mongo.Collection 'clientFiles'


@Files = new (FS.Collection)('files', stores: [ new (FS.Store.GridFS)('filesStore') ])
@Files.allow
  insert: (userId, doc) ->
    true
  update: (userId, doc, fieldNames, modifier) ->
    true
  download: (userId) ->
    true