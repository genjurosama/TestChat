Meteor.methods
  addNote: (doc)->
    check(doc, Object)
    colClientNotes.insert doc
  addClientFile: (doc)->
    check(doc, Object)
    colClientFiles.insert doc
  addClientItem: (doc, itemData)->
    check(doc, Object)
    check(itemData, Object)
    doc.itemData=itemData
    colClientItems.insert(doc)
