#Template.leadsEditModal.helpers
#  getType: ()->
#    type = "insert"
#    if this && this._id
#      type = "update"
#    console.log type
#    return type


leadsHook =
  onError: (formType, error)->
    Bert.alert("error"+formType+" "+error, 'danger');
  onSubmit: (insertDoc, updateDoc, currentDoc) ->
    if currentDoc._id
      Meteor.call 'userUpdate', updateDoc,currentDoc._id, (err, resp)->
        if err
          Bert.alert(err.reason, 'danger');
        else
          $('#myModal').modal('hide')
    else
      doc = {
        email: insertDoc.emails[0].address
      }
      Meteor.call 'registerUser', doc, insertDoc.profile, (err, resp)->
        if err
          Bert.alert(err.reason, 'danger');
        else
          $('#myModal').modal('hide')
          Meteor.call 'addUserRole', resp, 'lead'
    return false

AutoForm.addHooks(['leadsEdit'], leadsHook)