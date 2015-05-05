Template.emailBrowse.events
  'click .create-email': (e, tpl) ->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.emailEditModal, {}, $('#dialogContainer')[0]