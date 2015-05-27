Meteor.methods
  selectEmailService: () ->
    userData = Meteor.user()
    Meteor.Sendgrid.config({
      username: userData.profile.emailSettings.sendGrid.username,
      password: userData.profile.emailSettings.sendGrid.password
    })
  updateEmailDefault: (emailService) ->
    Meteor.users.update({_id: Meteor.userId()},{
      $set:{
        "profile.emailSettings.default": emailService
      }
    })

  sendEmail: (to, from, subject, content) ->
    if Meteor.user()?
      defaultSettings = Meteor.user().profile.emailSettings.default
      switch defaultSettings
        when 'mandril'
          Meteor.Mandrill.config
            username: Meteor.user().profile.emailSettings.mandril.username,
            key: Meteor.user().profile.emailSettings.mandril.apikey
        when 'sendGrid'
          Meteor.Sendgrid.config({
            username: Meteor.user().profile.emailSettings.sendGrid.username,
            password: Meteor.user().profile.emailSettings.sendGrid.password
          })
        when 'amazonSES'
          Meteor.AmazonSES.config
            username: Meteor.user().profile.emailSettings.amazonSES.username
            password: Meteor.user().profile.emailSettings.amazonSES.password
            host: Meteor.user().profile.emailSettings.amazonSES.host
        else
          throw new Meteor.Error 400, "You haven't set the email service default"
#      try
      Email.send
        to: to
        from: from
        subject: subject
        html: content
#      catch e
#        throw new Meteor.Error 400, e.message

  showMAIL_URL: () ->
    console.log process.env.MAIL_URL