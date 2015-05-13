Meteor.publish 'colClientFiles', ->
  colClientFiles.find {}
Meteor.publish 'colClientItems', ->
  colClientItems.find {}
Meteor.publish 'Files', ->
  Files.find {}