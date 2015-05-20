Template.cellLeadsActions.events
  'click .btn-edit-lead': (e, tpl) ->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.leadsEditModal, this, $('#dialogContainer')[0]
  'click .btn-delete-lead': (e, tpl) ->
    if confirm "Are you sure you want to delete this lead?"
      Meteor.call 'userDelete', this._id
  'click .btn-close-lead': (e, tpl) ->
    if confirm "Are you sure you closed the lead and make into a client?"
      cid = tpl.data._id
      Meteor.call 'removeUserRole', cid, 'lead'
      Meteor.call 'addUserRole', cid, 'client'
