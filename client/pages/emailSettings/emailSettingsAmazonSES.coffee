Template.emailSettingsAmazonSES.helpers
  isChecked: () ->
    defaultSettings = @profile?.emailSettings.default
    if defaultSettings is 'amazonSES'
      true
    else
      false