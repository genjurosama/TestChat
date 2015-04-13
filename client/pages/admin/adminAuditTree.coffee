Template.adminAuditTree.rendered = ()->

    updateTree = ()->
      data = $('.sortable').nestedSortable('toHierarchy', {startDepthCount: 1})
      Meteor.call 'updateAuditTree', data, ()->
        console.log colAdminSystem.findOne({name: "auditTree"}).data
        $('#nested').html("")
        Blaze.renderWithData Template.nestedList, {}, $('#nested')[0]
        $('.sortable').nestedSortable
          handle: 'div'
          items: 'li'
          attribute: 'data_id'
          toleranceElement: '> div'
          protectRoot: true
          update: ( event, ui )->
            updateTree()

    $('.sortable').nestedSortable
      handle: 'div'
      items: 'li'
      attribute: 'data_id'
      toleranceElement: '> div'
      protectRoot: true
      update: ( event, ui )->
        updateTree()




Template.nestedList.helpers
  getTree: ()->
    colAdminSystem.findOne({name: "auditTree"}).data

Template.treeListItem.helpers
  haveChildren: ()->
    return this.children && this.children.length>0
  getName: (id)->
    row = colAuditItems.findOne({item_id: id})
    if row
      return row.title