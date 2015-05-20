Router.route "leads",
  onBeforeAction: ->
    Router.go("leads.browse")

Router.route "/leads/browse",
  name: "leads.browse"

Router.route "/leads/hot",
  name :'leads.hot'

Router.route '/leads/warm',
  name: 'leads.warm'

Router.route '/leads/cold',
  name: 'leads.cold'
