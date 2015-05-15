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
  changeItemStatus: (id, itemType, status, bureau)->
    check(id, String)
    check(itemType, String)
    check(status, String)
    check(bureau, String)
    doc = {}
    doc["itemData."+itemType+"."+bureau+".itemStatus"] = status
    colClientItems.update({_id: id}, {$set: doc})
