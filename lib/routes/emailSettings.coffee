Router.route 'emailSettings',
  onBeforeAction: ->
    Router.go("emailSettings.mandril")

Router.route 'emailSettings.mandril',
  data: ()->
    return Meteor.user()
    
Router.route 'emailSettings.sendGrid',
  data: ()->
    return Meteor.user()
Router.route 'emailSettings.amazonSES',
  data: ()->
    return Meteor.user()