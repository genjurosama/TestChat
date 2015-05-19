Template.leadsPastdue.helpers
  selector: ()->
    return "profile.status" : "Past Due"

Template.leadsPastdue.events
  'click .create-lead': (e, tpl) ->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.leadsEditModal, {}, $('#dialogContainer')[0]