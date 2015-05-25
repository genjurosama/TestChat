Meteor.methods
  selectEmailService: () ->
    userData = Meteor.user()
    Meteor.Sendgrid.config({
      username: userData.profile.emailSettings.sendGrid.username,
      password: userData.profile.emailSettings.sendGrid.password
    })
  sendEmailTest: () ->
    Meteor.Sendgrid.send
      to: 'nltrunghau@gmail.com'
      from: 'no-reply@where-ever.com'
      subject: 'I really like sending emails with Sendgrid!'
      text: 'Sendgrid is totally awesome for sending emails!'

  setEmailServiceDefautl: (emailService) ->
    Meteor.users.update _id: Meteor.userId(),
      $set:
        emailSettings:
          default: emailService