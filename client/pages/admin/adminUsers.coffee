Template.adminUsers.rendered = ()->
  $(document).ready ->

    # Add event listener for opening and closing details
    str = '#DataTables_Table_0'
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
        #row.child(showExtra(row.data().profile,2, {'name'})).show()
        row.child(Blaze.toHTMLWithData(Template.usersExtras, row.data().profile)).show()
        tr.addClass 'shown'
        $(this).find("i").removeClass 'fa-plus'
        $(this).find("i").addClass 'fa-minus'
      return
    return

Template.adminUsers.events
  'click .create-client': (e, tpl) ->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.userEditModal, {}, $('#dialogContainer')[0]

Template.cellUsersActions.events
  'click .btn-edit-user': (e, tpl) ->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.userEditModal, this, $('#dialogContainer')[0]
  'click .btn-delete-user': (e, tpl) ->
    if confirm "Are you sure?"
      Meteor.call 'userDelete', this._id



profileHook =
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
    return false


AutoForm.addHooks(['profileEdit', 'profileCreate'], profileHook)