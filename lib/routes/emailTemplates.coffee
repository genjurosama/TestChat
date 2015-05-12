Router.route "templates",
  onBeforeAction: ->
    Router.go("/templates/stock")

Router.route "templatesstock",
  onBeforeAction: ->
    Router.go("/templates/stock")

Router.route "templatesmine",
  onBeforeAction: ->
    Router.go("/templates/mine")

Router.route '/templates/:_type',
  path:"/templates/:_type"
  action: ->
    console.log "templates route"
    @render 'templates'+@params._type, data: @params._type
    return

