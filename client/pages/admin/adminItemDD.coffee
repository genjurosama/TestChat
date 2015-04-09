Template.adminItemDD.helpers
  'systemData': ()->
    return colAdminSystem.findOne({name: "dropDowns"})

Template.adminItemDD.rendered = ()->
  $(document).ready ->
    $('.checkbox').parent().css({"font-size":"80%","display":"inline-block", "margin-right":"20px"})
    return