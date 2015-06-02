Template.formsList.events
  'click .create-item': ()->
    console.log("create")
    Router.go("clientFormsCreator")
Template.formsList.events
  'click .btn-edit-item': (e, tpl) ->
    Router.go("forms.edit",{_id:this._id})
  'click .btn-view-item': (e, tpl) ->
    Router.go("forms",{_id:this._id})
  'click .btn-delete-item': (e, tpl) ->
    if confirm "Are you sure?"
      Meteor.call 'itemDelete', this._id