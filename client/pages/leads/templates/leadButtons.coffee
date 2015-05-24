Template.leadButtons.events
  'click .btn-dashboard': (e, tpl)->
    Router.go("leadDashboard",{_id:this._id})
#  'click .btn-items': (e, tpl)->
#    Router.go("clientItems",{_id:this._id})
#  'click .btn-audit': (e, tpl)->
#    Router.go("clientAudit",{_id:this._id})
#  'click .btn-letters-creator' : (e,tpl)->
#    Router.go("clientLettersCreator",{_id:this._id})