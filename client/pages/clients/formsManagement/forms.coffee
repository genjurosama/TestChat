Template.formsList.events
  'click .btn-send-item': (e, tpl) ->
    console.log("send")
    $('#dialogContainer').html("")
    type =tpl.data;
    Blaze.renderWithData Template.formSendModal, {}, $('#dialogContainer')[0]