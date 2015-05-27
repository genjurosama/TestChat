Template.emailSettingsMandril.helpers
  isChecked: () ->
    defaultSettings = @profile?.emailSettings.default
    if defaultSettings is 'mandril'
      true
    else
      false