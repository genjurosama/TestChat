Template.leadsPending.helpers
  selector: ()->
    return "profile.status" : "Pending"

Template.leadsPending.events
  'click .create-lead': (e, tpl) ->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.leadsEditModal, {}, $('#dialogContainer')[0]