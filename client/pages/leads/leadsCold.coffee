Template.leadsCold.helpers
  selector: ()->
    return "profile.leadQuality" : "Cold"

Template.leadsCold.events
  'click .create-lead': (e, tpl) ->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.leadsEditModal, {}, $('#dialogContainer')[0]