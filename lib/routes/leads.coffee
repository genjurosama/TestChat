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

Router.route "lead/dashboard/:_id",
  name: 'leadDashboard'
  data: ()->
    return {_id: this.params._id}

Router.route "lead/notes/:_id",
  name: 'leadNotes'
  data: ()->
    return {_id: this.params._id}
