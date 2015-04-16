Template.treeListItem.events
  'click .edit-tree': (e)->
    data = colAuditItems.findOne item_id: this.id
    if !data
      data={}
    $('#dialogContainer').html("")
    data.id = this.id
    if this.children
      data.children = this.children
    Blaze.renderWithData Template.auditEditModal, data, $('#dialogContainer')[0]
  'click .add-tree': (e)->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.auditEditModal, this, $('#dialogContainer')[0]
  'click .delete-tree': (e, tpl) ->
    Meteor.call 'auditDelete', this.id
    $(e.currentTarget).parent().remove()
    updateTree()
  'click .tree-handler': (e)->
    e.stopPropagation()
    item = $(e.currentTarget).parent().parent()
    if $(e.currentTarget).hasClass("fa-minus")
      item.children("ol").hide()
      $(e.currentTarget).removeClass("fa-minus")
      $(e.currentTarget).addClass("fa-plus")
    else
      item.children("ol").show()
      $(e.currentTarget).removeClass("fa-plus")
      $(e.currentTarget).addClass("fa-minus")

Template.auditEditModal.helpers
  getType: ()->
    type = "insert"
    if this && this._id
      type = "update"
    return type
  haveNoChildren: ()->
    return !this.children
@updateTree = ()->
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
      isTree: true
      update: ( event, ui )->
        updateTree()

Template.adminAuditTree.events
  'click .collapse-all': (e)->
    $(".tree-handler.fa-minus").trigger("click")
  'click .expand-all': (e)->
    $(".tree-handler.fa-plus").trigger("click")

Template.adminAuditTree.rendered = ()->

  $('.sortable').nestedSortable
    handle: 'div'
    items: 'li'
    attribute: 'data_id'
    toleranceElement: '> div'
    protectRoot: true
    update: ( event, ui )->
      updateTree()


  if colAuditItems.find().count()<1
    $('.sortable ol').each((i,el)->
      $(el).children('li').each (i2,el2)->
        console.log $(el2).attr("data-id"), $(el2).children(".dd-handle").text()
        colAuditItems.insert({item_id: $(el2).attr("data_id").replace("item_",""), title: $(el2).children(".dd-handle").text()})
    )



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
  getID: (id)->
    row = colAuditItems.findOne({item_id: id})
    if row
      return row._id

auditHook =
  onSuccess: (formType, result)->
    console.log formType
    if formType=="insert"
      doc = colAuditItems.findOne _id: this.docId
      id = this.currentDoc.id
      console.log doc.item_id, this.docId, id
      $("[data_id=item_"+id+"] ol").append('<li data_id="item_'+doc.item_id+'" class="dd-item"><div class="dd-handle ui-sortable-handle">'+doc.title+'</div></li>')
      updateTree()
    $('#myModal').modal('hide')
  onError: (formType, result)->
    console.log formType, result
AutoForm.addHooks(['auditEdit'], auditHook)