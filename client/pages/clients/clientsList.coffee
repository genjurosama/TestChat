Template.clientButtons.events
  'click .btn-dashboard': (e, tpl)->
    Router.go("clientDashboard",{_id:this._id})
  'click .btn-items': (e, tpl)->
    Router.go("clientItems",{_id:this._id})
  'click .btn-audit': (e, tpl)->
    Router.go("clientAudit",{_id:this._id})
   'click .btn-letters-creator' : (e,tpl)->
     Router.go("clientLettersCreator",{_id:this._id})

Template.clientsList.rendered = ()->


    # Add event listener for opening and closing details
    str = 'table[id^=DataTables_Table_]'
    if !$(str)[0]
      str='#DataTables_Table_1'
    table = $(str).DataTable()
    $(str).on 'click', 'td.details-control', ->
      tr = $(this).closest('tr')
      row = table.row(tr)
      if row.child.isShown()
        # This row is already open - close it
        row.child.hide()
        tr.removeClass 'shown'
        $(this).find("i").removeClass 'fa-minus'
        $(this).find("i").addClass 'fa-plus'
      else
        # Open this row
        #row.child(Blaze.toHTMLWithData(Template.clientsExtras, row.data().profile)).show()
        row.child("").show()
        el = tr.next()
        Blaze.renderWithData Template.clientsExtras, row.data(), el.find("td")[0]
        tr.addClass 'shown'
        $(this).find("i").removeClass 'fa-plus'
        $(this).find("i").addClass 'fa-minus'
      return
    return

Template.clientsList.events
  'click .create-client': (e, tpl) ->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.clientEditModal, {}, $('#dialogContainer')[0]

Template.cellClientsActions.events
  'click .btn-edit-user': (e, tpl) ->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.clientEditModal, this, $('#dialogContainer')[0]
  'click .btn-delete-user': (e, tpl) ->
    if confirm "Are you sure?"
      Meteor.call 'userDelete', this._id





clientHook =
  onError: (a, b)->
    console.log b.message
    Bert.alert(b.message, 'danger');
  onSubmit: (insertDoc, updateDoc, currentDoc) ->
    if currentDoc.profile
      Meteor.call 'userUpdate', updateDoc, currentDoc._id, (err, resp)->
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
          Meteor.call 'addUserRole', resp, 'client'
    return false


AutoForm.addHooks(['clientEdit'], clientHook)

