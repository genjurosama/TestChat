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

Meteor.AmazonSES =
  config: (options) ->
    username = encodeURIComponent(options['username'])
    password = encodeURIComponent(options['password'])
#    host = encodeURIComponent(options['host'])
    host = '@ses-smtp-user.20150527-035642'
    port = '465'
    process.env.MAIL_URL = 'smtp://' + username + ':' + password + host + ':' + port + '/'
    return
  send: (options) ->
    Email.send options
    return
