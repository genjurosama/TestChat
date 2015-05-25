TEMPLATE_TYPE_STOCK = "stock";
TEMPLATE_TYPE_MINE = "stock";
type =""
Template.templatesstock.events
  'click .create-email': (e, tpl) ->
    $('#dialogContainer').html("")
    type =tpl.data;
    Blaze.renderWithData Template.emailEditModal, {}, $('#dialogContainer')[0]

Template.templatesmine.events
  'click .create-email': (e, tpl) ->
    $('#dialogContainer').html("")
    type =tpl.data;
    Blaze.renderWithData Template.emailEditModal, {}, $('#dialogContainer')[0]


Template.cellEmailTemplatesActions.events

  'click .btn-edit-furnisher': (e, tpl) ->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.emailEditModal, this, $('#dialogContainer')[0]
  'click .btn-view-furnisher': (e, tpl) ->
    console.log("view")
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.emailTemplateView, this, $('#dialogContainer')[0]
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


Template.emailEditForm.helpers
  customerVariables: ()->
    customerVariables = ["Signature","First Name","Last Name","SSN","DOB","Address Line 1","Address Line 2","City","State","Zip","Phone 1","Phone 2","Fax"
    ]

    return customerVariables
  recipientVariables: ()->
    recipientVariables = ["Name","Address Line 1","Address Line 2","City", "State","Zip","Phone","Fax","Phone 2","Fax"
    ]

    return recipientVariables

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
    console.log("submition")
    if currentDoc._id
      Meteor.call 'emailTemplateUpdate', updateDoc,currentDoc._id, (err, resp)->
      if err
        Bert.alert(err.reason, 'danger');
      else
        $('#myModal').modal('hide')
    else
      console.log(type);
      if type isnt ""
        insertDoc.type=type
        insertDoc.uid =Meteor.userId();
        console.log(Meteor.userId())
        Meteor.call 'addNewEmailTemplate', insertDoc, (err, resp)->
          if err
            Bert.alert(err.reason, 'danger');
          else
            $('#myModal').modal('hide')

    return false



AutoForm.addHooks(['emailTemplateEdit'], emailTemplateHook)
