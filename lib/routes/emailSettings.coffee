Router.route 'emailSettings',
  onBeforeAction: ->
    Router.go("emailSettings.mandril")

Router.route 'emailSettings.mandril'
Router.route 'emailSettings.sendGrid',
  data: ()->
    return Meteor.user()
Router.route 'emailSettings.amazonSES'