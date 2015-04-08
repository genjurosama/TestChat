Router.route "admin",
  onBeforeAction: ->
    Router.go("admin.users")
Router.route "admin.users"