Template.leadsInactive.helpers
  selector: ()->
    return "profile.status" : "Inactive"

Template.leadsInactive.events
  'click .create-lead': (e, tpl) ->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.leadsEditModal, {}, $('#dialogContainer')[0]