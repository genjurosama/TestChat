Template.emailBrowse.events
  'click .create-email': (e, tpl) ->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.emailEditModal, {}, $('#dialogContainer')[0]

Template.cellEmailTemplatesActions.events
  'click .btn-edit-furnisher': (e, tpl) ->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.emailEditModal, this, $('#dialogContainer')[0]
  'click .btn-delete-furnisher': (e, tpl) ->
    id = this._id
    sweetAlert {
      title: 'Are you sure?'
      text: 'You will not be able to recover Template!'
      type: 'warning'
      showCancelButton: true
      confirmButtonColor: '#DD6B55'
      confirmButtonText: 'Yes, delete it!'
      closeOnConfirm: false
    }, ->
      Meteor.call 'emailTemplateDelete',id, (err, result) ->
        if result
          sweetAlert 'Deleted!', 'Your imaginary file has been deleted.', 'success'
        return


Template.emailEditModal.helpers
  getType: ()->
    type = "insert"
    if this && this._id
      type = "update"
    return type

emailTemplateHook =
  onError: (formType, error)->
    Bert.alert("error"+formType+" "+error, 'danger');
  onSubmit: (insertDoc, updateDoc, currentDoc) ->
    console.log "inserting"
    if currentDoc._id
      Meteor.call 'emailTemplateUpdate', updateDoc,currentDoc._id, (err, resp)->
      if err
        Bert.alert(err.reason, 'danger');
      else
        $('#myModal').modal('hide')
    else
      Meteor.call 'addNewEmailTemplate', insertDoc, (err, resp)->
        if err
          Bert.alert(err.reason, 'danger');
        else
          $('#myModal').modal('hide')

    return false

AutoForm.addHooks(['emailTemplateEdit'], emailTemplateHook)
