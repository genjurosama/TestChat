Meteor.publish 'colClientFiles', ->
  colClientFiles.find {}
Meteor.publish 'Files', ->
  Files.find {}