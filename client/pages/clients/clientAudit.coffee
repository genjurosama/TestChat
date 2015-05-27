Template.clientAudit.events
  'click .create-audit': ()->
    Router.go("clientAuditCreate",{_id:this._id})

Template.auditActions.events
  'click .btn-view-audit': (e, tpl) ->
    html = this.description
    Meteor.call "getPdf", html, (err,result)->
      item = PdfCollection.findOne({_id : result});
      blob = new Blob([item.pdf], {type: 'application/pdf'});
      saveAs(blob, 'test.pdf');
      PdfCollection.remove({_id : result});
  'click .btn-delete-audit': (e, tpl) ->
    if confirm "Are you sure?"
      Meteor.call 'clientAuditDelete', this._id




