Template.leadNotes.helpers
  leadData: ()->
    Meteor.users.findOne this._id

Template.leadNotes.events
  'click .add-note': (e)->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.leadNoteModal, this, $('#dialogContainer')[0]

leadNoteHook =
  onSubmit: (insertDoc, updateDoc, currentDoc) ->
    insertDoc.clientID = currentDoc._id
    insertDoc.authorID = Meteor.userId()
    Meteor.call 'addNote', insertDoc, (err, resp)->
      if err
        Bert.alert(err.reason, 'danger');
      else
        $('#myModal').modal('hide')

    return false
  onError: (formType, result)->
    console.log formType, result

AutoForm.addHooks(['leadNoteCreate'], leadNoteHook)
