Template.leadButtons.events
  'click .btn-dashboard': (e, tpl)->
    Router.go("leadDashboard",{_id:this._id})
  'click .btn-notes': (e, tpl)->
    Router.go("leadNotes",{_id:this._id})
