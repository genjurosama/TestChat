Template.leadsHot.helpers
  selector: ()->
    return "profile.leadQuality" : "Hot"

Template.leadsHot.events
  'click .create-lead': (e, tpl) ->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.leadsEditModal, {}, $('#dialogContainer')[0]