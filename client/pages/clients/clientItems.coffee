Template.itemExtras.helpers
  getItemHeaders: ()->
    data = this.itemData[this.itemType]
    headers = []
    $.each data, (k,v)->
      headers.push(creditBureaus[k].image)
    return headers
  getItemData: ()->
    data = this.itemData[this.itemType]
    table = {}
    $.each data, (k,item)->
      $.each item, (field,val)->
        if !table[field]
          table[field] = {label: field, data:[]}
        if val instanceof Date
          val = moment(val).format('LLLL')
        table[field].data.push(val)

    retData = $.map table, (value, index) ->
      [ value ]
    console.log retData
    return retData

Template.clientItems.events
  'click .create-item': ()->
    Router.go("clientItemCreate",{_id:this._id})

Template.itemStatus.events
  'click .change-status': (e, tpl) ->
    e.preventDefault()
    Meteor.call 'changeItemStatus', tpl.data._id, tpl.data.itemType, this.key, $(e.currentTarget).attr("data")


Template.itemStatus.helpers
  getStatusInfo: (data, bureau)->
    if data.itemData[data.itemType][bureau]
      return data.itemData[data.itemType][bureau]
    else
      return {notReported: true}

Template.clientItems.rendered = ()->
  # Add event listener for opening and closing details
  str = 'table[id^=DataTables_Table_]'
  if !$(str)[0]
    str='#DataTables_Table_1'
  table = $(str).DataTable()
  $(str).on 'click', 'td.details-control', ->
    tr = $(this).closest('tr')
    row = table.row(tr)
    if row.child.isShown()
      # This row is already open - close it
      row.child.hide()
      #tr.removeClass 'shown'
      $(this).find("i").removeClass 'fa-minus'
      $(this).find("i").addClass 'fa-plus'
    else
      # Open this row
      row.child("").show()
      el = tr.next()

      Blaze.renderWithData Template.itemExtras, row.data(), el.find("td")[0]
      #tr.addClass 'shown'
      $(this).find("i").removeClass 'fa-plus'
      $(this).find("i").addClass 'fa-minus'
    return
  return