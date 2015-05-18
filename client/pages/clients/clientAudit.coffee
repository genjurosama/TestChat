Template.clientAudit.events
  'click .create-audit': ()->
    Router.go("clientAuditCreate",{_id:this._id})

Template.auditActions.events
  'click .btn-view-audit': (e, tpl) ->
    console.log this
  'click .btn-delete-audit': (e, tpl) ->
    if confirm "Are you sure?"
      Meteor.call 'auditDelete', this._id




