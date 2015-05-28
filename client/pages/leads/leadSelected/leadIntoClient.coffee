Template.leadIntoClient.helpers
  leadData: ()->
    Meteor.users.findOne this._id

leadIntoClientHook =
  onError: (a, b)->
    Bert.alert(b.message, 'danger');
  onSubmit: (insertDoc, updateDoc, currentDoc) ->
    if currentDoc.profile
      if confirm "Are you sure you checked all info and want to make the lead into a client?"
        Meteor.call 'userUpdate', updateDoc, currentDoc._id, (err, resp)->
          if err
            Bert.alert(err.reason, 'danger');
          else
            cid = currentDoc._id
            Meteor.call 'removeUserRole', cid, 'lead'
            Meteor.call 'addUserRole', cid, 'client'
            Router.go('leads')
            return
    return false

AutoForm.addHooks(["leadIntoClient"], leadIntoClientHook)