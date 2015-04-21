Router.route "clients",
  onBeforeAction: ->
    Router.go("clients.list")

Router.route "clients.list",
  waitOn: ()->
    return [subs.subscribe "colAdminSystem"]

Router.route "client.dashboard/:_id",
  name: 'clientDashboard'
  data: ()->
    return {_id: this.params._id}
  waitOn: ()->
    return [subs.subscribe "colAdminSystem"]

Router.route "client.audit/:_id",
  name: 'clientAudit'
  data: ()->
    return {_id: this.params._id}
  waitOn: ()->
    return [subs.subscribe "colAdminSystem"]