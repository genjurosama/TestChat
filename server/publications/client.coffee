Meteor.publish 'colClientFiles', ->
  colClientFiles.find {}
Meteor.publish 'colClientItems', ->
  colClientItems.find {}
Meteor.publish 'colClientAudit', ->
  colClientAudit.find {}
Meteor.publish 'Files', ->
  Files.find {}