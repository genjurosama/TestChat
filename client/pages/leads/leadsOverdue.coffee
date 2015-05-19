Template.leadsOverdue.helpers
  selector: ()->
    return "profile.status" : "Results Overdue"

Template.leadsOverdue.events
  'click .create-lead': (e, tpl) ->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.leadsEditModal, {}, $('#dialogContainer')[0]