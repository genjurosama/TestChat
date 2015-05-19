Template.leadsCanceled.helpers
  selector: ()->
    return "profile.status" : "Canceled"

Template.leadsCanceled.events
  'click .create-lead': (e, tpl) ->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.leadsEditModal, {}, $('#dialogContainer')[0]