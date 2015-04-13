Meteor.methods
  furnisherDelete: (id)->
    check(id, String)
    colFurhishers.remove({_id: id})
  updateAuditTree: (data)->
    check(data, Array)
    colAdminSystem.update({name: "auditTree"}, {$set:{data: data}})