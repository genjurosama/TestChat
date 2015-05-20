Template.leadsWarm.rendered = ()->

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
      tr.removeClass 'shown'
      $(this).find("i").removeClass 'fa-minus'
      $(this).find("i").addClass 'fa-plus'
    else
# Open this row
#row.child(Blaze.toHTMLWithData(Template.clientsExtras, row.data().profile)).show()
      row.child("").show()
      el = tr.next()
      Blaze.renderWithData Template.leadsExtras, row.data(), el.find("td")[0]
      tr.addClass 'shown'
      $(this).find("i").removeClass 'fa-plus'
      $(this).find("i").addClass 'fa-minus'
    return
  return

Template.leadsWarm.helpers
  selector: ()->
    return "profile.leadQuality" : "Warm"

Template.leadsWarm.events
  'click .create-lead': (e, tpl) ->
    $('#dialogContainer').html("")
    Blaze.renderWithData Template.leadsEditModal, {}, $('#dialogContainer')[0]