Template.adminSnipets.helpers
  'systemData': ()->
    return colAdminSystem.findOne({name: "dropDowns"})
