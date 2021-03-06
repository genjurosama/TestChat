Template.leadDashboard.rendered = ()->
  widgetToggle()

Template.leadDashboard.helpers
  leadData: ()->
    Meteor.users.findOne this._id

Template.leadDashboard.events
  'click .add-note': (e)->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.leadNoteModal, this, $('#dialogContainer')[0]
  'click .btn-edit-lead': (e, tpl) ->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.leadsEditModal, this, $('#dialogContainer')[0]

