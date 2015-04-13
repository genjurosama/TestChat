Template.adminFurnishers.events
  'click .create-furnisher': (e, tpl) ->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.furnisherEditModal, null, $('#dialogContainer')[0]
    AutoForm.resetForm("furnisherEdit")

Template.cellFurnishersActions.events
  'click .btn-edit-furnisher': (e, tpl) ->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.furnisherEditModal, this, $('#dialogContainer')[0]
  'click .btn-delete-furnisher': (e, tpl) ->
    if confirm "Are you sure?"
      Meteor.call 'furnisherDelete', this._id

Template.furnisherEditModal.helpers
  getType: ()->
    type = "insert"
    if this && this._id
      type = "update"
    return type

furnisherHook =
  onSuccess: (formType, result)->
    $('#myModal').modal('hide')

AutoForm.addHooks(['furnisherEdit'], furnisherHook)



