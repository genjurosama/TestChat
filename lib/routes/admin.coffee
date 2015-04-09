Router.route "admin",
  onBeforeAction: ->
    Router.go("admin.users")

Router.route "admin.users"
Router.route "admin.itemDD",
  waitOn: ()->
    return [subs.subscribe "colAdminSystem"]
Router.route "admin.snipets",
  waitOn: ()->
    return [subs.subscribe "colAdminSystem"]
Router.route "admin.repSources",
  waitOn: ()->
    return [subs.subscribe "colAdminSystem"]
Router.route "admin.groupEmails",
  waitOn: ()->
    return [subs.subscribe "colAdminSystem"]
