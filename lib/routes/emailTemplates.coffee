Router.route "emailTemplates",
  onBeforeAction: ->
    Router.go("email.browse")

Router.route "email.browse",
  waitOn: ()->
    return [subs.subscribe "colEmailTemplates"]
