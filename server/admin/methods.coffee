Meteor.methods
  auditDelete: (id)->
    check(id, String)
    colAuditItems.remove({item_id: id})
  furnisherDelete: (id)->
    check(id, String)
    colFurhishers.remove({_id: id})
  updateAuditTree: (data)->
    check(data, Array)
    colAdminSystem.update({name: "auditTree"}, {$set:{data: data}})
  removeUserRole: (uid, role)->
    check(uid, String)
    check(role, String)
    Roles.removeUsersFromRoles(uid, [role])
  addUserRole: (uid, role)->
    check(uid, String)
    check(role, String)
    Roles.addUsersToRoles(uid, [role])