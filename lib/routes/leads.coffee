Router.route "leads",
  onBeforeAction: ->
    Router.go("leads.browse")

Router.route "leads.browse",
  waitOn: ()->
    return [subs.subscribe "colLeads"]
