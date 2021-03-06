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
    return [subs.subscribe "colClientFiles", subs.subscribe "Files"]

Router.route "client.audit/:_id",
  name: 'clientAudit'
  data: ()->
    return {_id: this.params._id}
  waitOn: ()->
    return [subs.subscribe "colAdminSystem"]
Router.route "client.auditCreate/:_id",
	name: 'clientAuditCreate'
	waitOn: ()->
		return [subs.subscribe "colAdminSystem", subs.subscribe "colClientItems"]
	data: ()->
		return {_id: this.params._id}

Router.route "client.items/:_id",
	name: 'clientItems'
	waitOn: ()->
		return [subs.subscribe "colAdminSystem", subs.subscribe "colClientItems"]
	data: ()->
		return {_id: this.params._id}
Router.route "client.itemCreate/:_id",
	name: 'clientItemCreate'
	waitOn: ()->
		return [subs.subscribe "colFurhishers", subs.subscribe "colAdminSystem", subs.subscribe "colClientItems", subs.subscribe "colAuditItems"]
	data: ()->
		return {_id: this.params._id}
Router.route "client.itemEdit/:_id/:edit_id",
	name: 'clientItemEdit'
	template: 'clientItemCreate'
	waitOn: ()->
		return [subs.subscribe "colFurhishers", subs.subscribe "colAdminSystem", subs.subscribe "colClientItems", subs.subscribe "colAuditItems"]
	data: ()->
		return {_id:this.params._id, doc:colClientItems.findOne({_id:this.params.edit_id})}

Router.route "client.letters/:_id",
	name: 'clientLetters'
	data: ()->
		return {_id: this.params._id}

Router.route "client.notes/:_id",
	name: 'clientNotes'
	data: ()->
		return {_id: this.params._id} 
Router.route "client.billing/:_id",
	name: 'clientBilling'
	data: ()->
		return {_id: this.params._id} 
Router.route "client.activity/:_id",
	name: 'clientActivity'
	data: ()->
		return {_id: this.params._id} 