Router.route "clients",
  onBeforeAction: ->
    Router.go("clients.list")

Router.route "clients.list",
  waitOn: ()->
    return [subs.subscribe "colAdminSystem"]