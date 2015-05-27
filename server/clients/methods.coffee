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
  addClientAudit: (doc)->
    check(doc, Object)
    colClientAudit.insert(doc)
  updateClientItem: (doc, itemData, id)->
    check(doc, Object)
    check(itemData, Object)
    check(id, String)
    doc.itemData=itemData
    colClientItems.update({_id: id}, {$set: doc})
  changeItemStatus: (id, itemType, status, bureau)->
    check(id, String)
    check(itemType, String)
    check(status, String)
    check(bureau, String)
    doc = {}
    doc["itemData."+itemType+"."+bureau+".itemStatus"] = status
    colClientItems.update({_id: id}, {$set: doc})
  itemDelete: (id)->
    check(id, String)
    colClientItems.remove({_id: id})
  clientAuditDelete: (id)->
    check(id, String)
    colClientAudit.remove({_id: id})
