Router.route "leads",
  onBeforeAction: ->
    Router.go("leads.browse")

Router.route "leads.browse"
Router.route 'leads.hot'
Router.route 'leads.warm'
Router.route 'leads.cold'
Router.route 'leads.active'
Router.route 'leads.inactive'
Router.route 'leads.pending'
Router.route 'leads.overdue'
Router.route 'leads.pastdue'
Router.route 'leads.canceled'
