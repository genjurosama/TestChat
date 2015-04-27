Template.clientTabs.rendered = ()->
  widgetToggle()
  $(".clientData").trigger("click")

Template.autoForm.rendered = ()->
  $ ->
    $('input').iCheck {checkboxClass: 'icheckbox_flat-green'}

Template.clientDashboard.helpers
  clientData: ()->
    Meteor.users.findOne this._id
  clientFiles: ()->
    colClientFiles.find({clientID: this._id},{sort: {createdAt: -1}})

Template.clientDashboard.events
  'click .add-note': (e)->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.noteModal, this, $('#dialogContainer')[0]

noteHook =
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

AutoForm.addHooks(['noteCreate'], noteHook)

fileHook =
  onSubmit: (insertDoc, updateDoc, currentDoc) ->
    insertDoc.clientID = currentDoc._id
    insertDoc.authorID = Meteor.userId()
    Meteor.call 'addClientFile', insertDoc, (err, resp)->
      if err
        Bert.alert(err.reason, 'danger');
      else
        AutoForm.resetForm("fileUpload")
        #console.log($("#fileUpload"),$("#fileUpload").reset());

    return false
  onError: (formType, result)->
    console.log formType, result

AutoForm.addHooks(['fileUpload'], fileHook)