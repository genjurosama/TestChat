Meteor.publish null, ->
  Meteor.users.find {}
Meteor.publish null, ->
  Meteor.roles.find {}
Meteor.publish 'users', ->
  Meteor.users.find {}