Router.route "admin",
  onBeforeAction: ->
    Router.go("admin.users")

Router.route "admin.users"
Router.route "admin.itemDD",
  waitOn: ()->
    return [subs.subscribe "colAdminSystem"]
Router.route "admin.snipets"
Router.route "admin.repSources"
Router.route "admin.groupEmails"
