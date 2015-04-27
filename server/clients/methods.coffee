Meteor.methods
  addNote: (doc)->
    check(doc, Object)
    colClientNotes.insert doc
  addClientFile: (doc)->
    check(doc, Object)
    colClientFiles.insert doc
