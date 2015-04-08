Template.userBar.events 'click .logout': ->
  Meteor.logout (error) ->
    if error
      Bert.alert error.reason, 'danger'
    else
      Bert.alert 'Succesfully logged out!', 'success'
    return
  return