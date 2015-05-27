Template.emailSettingsSendGrid.helpers
  isChecked: () ->
    defaultSettings = @profile?.emailSettings.default
    if defaultSettings is 'sendGrid'
      true
    else
      false