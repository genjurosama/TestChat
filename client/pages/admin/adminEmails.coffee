Template.adminEmails.helpers
  'systemData': ()->
    return colAdminSystem.findOne({name: "dropDowns"})
