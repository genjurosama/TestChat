emailSettingsHook =
  onSubmit: (insertDoc, updateDoc, currentDoc) ->
    emailService = $('.select-default-email-service:checked').data('type')
    Meteor.call 'setEmailServiceDefautl', emailService, (err) ->
      console.log (err.reason) if err
    return false


AutoForm.hooks({
  updateSendGrid: emailSettingsHook
});