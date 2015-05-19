Template.leadsWarm.helpers
  selector: ()->
    return "profile.leadQuality" : "Warm"

Template.leadsWarm.events
  'click .create-lead': (e, tpl) ->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.leadsEditModal, {}, $('#dialogContainer')[0]