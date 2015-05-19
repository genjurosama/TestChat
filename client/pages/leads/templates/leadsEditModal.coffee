Template.leadsEditModal.helpers
  getType: ()->
    type = "insert"
    if this && this._id
      type = "update"
    return type
