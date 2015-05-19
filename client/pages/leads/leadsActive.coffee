Template.leadsActive.helpers
  selector: ()->
    return "profile.status" : "Active"

Template.leadsActive.events
  'click .create-lead': (e, tpl) ->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.leadsEditModal, {}, $('#dialogContainer')[0]
