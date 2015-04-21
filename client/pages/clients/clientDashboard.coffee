Template.clientTabs.rendered = ()->
  widgetToggle()

Template.autoForm.rendered = ()->
  $ ->
    $('input').iCheck {checkboxClass: 'icheckbox_flat-green'}

Template.clientDashboard.helpers
  clientData: ()->
    Meteor.users.findOne this._id

Template.clientDashboard.events
  'click .add-note': (e)->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.noteModal, {}, $('#dialogContainer')[0]