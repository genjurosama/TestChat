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

  sendEmail: (options) ->
    Meteor.Email.send(options)

  showMAIL_URL: () ->
    console.log process.env.MAIL_URL
