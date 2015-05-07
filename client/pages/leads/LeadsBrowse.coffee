

Template.leadsBrowse.events
  'click .create-email': (e, tpl) ->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.leadsEditModal, {}, $('#dialogContainer')[0]




Template.leadsEditModal.helpers
  getType: ()->
    type = "insert"
    if this && this._id
      type = "update"
    return type

leadsHook =
  onError: (formType, error)->
    Bert.alert("error"+formType+" "+error, 'danger');
  onSubmit: (insertDoc, updateDoc, currentDoc) ->
    console.log "inserting"
    if currentDoc._id
      Meteor.call 'leadUpdate', updateDoc,currentDoc._id, (err, resp)->
      if err
        Bert.alert(err.reason, 'danger');
      else
        $('#myModal').modal('hide')
    else
      Meteor.call 'addNewLead', insertDoc, (err, resp)->
        if err
          Bert.alert(err.reason, 'danger');
        else
          $('#myModal').modal('hide')

    return false

AutoForm.addHooks(['leadsEdit'], leadsHook)
