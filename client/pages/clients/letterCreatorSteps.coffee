Meteor.subscribe "colClientItems"
Template.letterCreatorItemStep2.helpers
  accounts:
    colClientItems.find({itemType:"account"})
  collections:
    colClientItems.find({itemType:"collection"})
  publicRecords:
    colClientItems.find({itemType:"publicRecord"})
  publicRecords:
    colClientItems.find({itemType:"inquiry"})

