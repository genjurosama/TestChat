emailSettingsHook =
  onSuccess: (formType, result) ->
    emailService = $('.select-default-email-service:checked').data('type')
    formId = @formId
    defaultSettings = Meteor.user().profile.emailSettings.default
    if defaultSettings? and emailService?
      Meteor.call "updateEmailDefault", emailService, (err, res) ->
        if err?
          console.log err.reason
    else
      switch formId
        when 'updateMandrill'
          emailService = 'mandril'
        when 'updateAmazonSES'
          emailService = 'amazonSES'
        when 'updateSendGrid'
          emailService = 'sendGrid'
      Meteor.call "updateEmailDefault", emailService, (err, res) ->
        if err?
          console.log err.reason

AutoForm.addHooks ['updateMandrill', 'updateSendGrid', 'updateAmazonSES'], emailSettingsHook