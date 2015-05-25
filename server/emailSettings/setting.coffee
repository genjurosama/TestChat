Meteor.Sendgrid =
  config: (options) ->
    username = options['username']
    password = options['password']
    host = '@smtp.sendgrid.net'
    port = '465'
    process.env.MAIL_URL = 'smtp://' + username + ':' + password + host + ':' + port + '/'
    return
  send: (options) ->
    Email.send options
    return
