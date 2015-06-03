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
    return retData

Template.clientItems.events
  'click .create-item': ()->
    Router.go("clientItemCreate",{_id:this._id})
Template.itemActions.events
  'click .btn-edit-item': (e, tpl) ->
    Router.go("clientItemEdit",{_id:this.clientID, edit_id:this._id})
  'click .btn-delete-item': (e, tpl) ->
    if confirm "Are you sure?"
      Meteor.call 'itemDelete', this._id


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

Template.clientItems.helpers
  getItemsSelector: ()->
    return {clientID: this._id}

Template.clientItems.rendered = ()->
  tplData=this
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

###
uploadData = {"Incorrect Names":[{"Item Name":"DAVID BROWN","Order":"Equifax, Experian, TransUnion","Incorrect Name":"DAVID BROWN, DAVID BROWN, DAVID BROWN","Dispute Instructions":" Evidence has been given to your company with the correct name and spelling all other listings are incorrect and need to be deleted. ","Interviewer":" Missing ","Action":"IN DISPUTE, IN DISPUTE, IN DISPUTE","Status":"Negative, Negative, Negative","History":[{"Sent_on":" 4\/22\/2015 7:04 AM ","To":" Equifax ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:12 AM ","To":" Experian ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:19 AM ","To":" TransUnion ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" Equifax, Experian, TransUnion "}],"Incorrect Address":[{"Item Name":"105 OAKRIDGE WY 6, SHEPHERDSVILLE, KY 40165","Order":"Equifax, Experian, TransUnion","Address":"105 OAKRIDGE WY 6","City":"SHEPHERDSVILLE","State":"KY","Zip Code":"40165","Dispute Instructions":"There has been no residency at this address, please delete","Action":" IN DISPUTE ","Status":" Negative ","History":[{"Sent_on":" 4\/22\/2015 7:19 AM ","To":" TransUnion ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" TransUnion "},{"Item Name":"300 TYLER PKWY, SHEPHERDSVILLE, KY 40165","Order":"Equifax, Experian, TransUnion","Address":"300 TYLER PKWY, 300 TYLER PKWY","City":"SHEPHERDSVILLE, SHEPHERDSVILLE","State":"KY, KY","Zip Code":"40165, 40165","Dispute Instructions":"There has been no residency at this address, please delete","Action":" IN DISPUTE IN DISPUTE ","Status":" Negative Negative ","History":[{"Sent_on":" 4\/22\/2015 7:04 AM ","To":" Equifax ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:12 AM ","To":" Experian ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" Equifax, Experian "},{"Item Name":"FEDLOAN","Order":"Equifax, Experian, TransUnion","Address":"430 TYLER PKWY, 430 TYLER PKWY, 430 TYLER PKWY","City":"SHEPHERDSVILLE, SHEPHERDSVILLE, SHEPHERDSVILLE","State":"KY, KY, KY","Zip Code":"40165, 40165, 40165","Dispute Instructions":"There has been no residency at this address, please delete","Action":" IN DISPUTE IN DISPUTE IN DISPUTE ","Status":" Negative Negative Negative ","History":[{"Sent_on":" 4\/22\/2015 7:04 AM ","To":" Equifax ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:12 AM ","To":" Experian ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:19 AM ","To":" TransUnion ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" Equifax, Experian, TransUnion "},null],"Account":[{"Item Name":"FEDLOAN - 8222283518FD0XXXX","Account Number":"8222283518FD0XXXX, 8222283518FD0XXXX, 8222283518FD0XXXX","Balance Amount":"3894, 3894, 3894","Type":"Education Loan, Education Loan, Education Loan","Responsibility":"","Past Due Amount":"0, 0, 0","High Credit":"6000, 6000, 6000","Credit Limit":"","Payment Amount":"28, 28, 28","Date Opened":"06\/2010, 06\/2010, 06\/2010","Date Reported":"","Date of Last Activity":"","Past 7 yrs Late Payments":"","Internal Notes":"","SOL Clock":"","Dispute Instructions":"Please note that payments are not reporting accurately. The account was never late and should report accurately. Please show as paid as agreed and remove all references to every being delinquent.","Interviewer":"Missing","Action":"IN DISPUTE, IN DISPUTE, IN DISPUTE","Status":"Negative, Negative, Negative","History":[{"Sent_on":" 4\/22\/2015 7:04 AM ","To":" Equifax ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:12 AM ","To":" Experian ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:19 AM ","To":" TransUnion ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" Equifax, Experian, TransUnion "},{"Item Name":"FEDLOAN - 8222283518FD0XXXX","Account Number":"8222283518FD0XXXX, 8222283518FD0XXXX, 8222283518FD0XXXX","Balance Amount":"2419, 2419, 2419","Type":"Education Loan, Education Loan, Education Loan","Responsibility":"","Past Due Amount":"0, 0, 0","High Credit":"121, 121, 121","Credit Limit":"","Payment Amount":"","Date Opened":"03\/2011, 03\/2011, 03\/2011","Date Reported":"","Date of Last Activity":"","Past 7 yrs Late Payments":"","Internal Notes":"","SOL Clock":"","Dispute Instructions":"The dates you are reporting this account as being late the payments were actually in deferment. Payments are not to be reporting late under this agreement. Please see that this is corrected as quickly as possible.","Interviewer":"Missing","Action":"IN DISPUTE, IN DISPUTE, IN DISPUTE","Status":"Negative, Negative, Negative","History":[{"Sent_on":" 4\/22\/2015 7:04 AM ","To":" Equifax ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:12 AM ","To":" Experian ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:19 AM ","To":" TransUnion ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" Equifax, Experian, TransUnion "},{"Item Name":"FEDLOAN - 8222283518FD0XXXX","Account Number":"8222283518FD0XXXX, 8222283518FD0XXXX, 8222283518FD0XXXX","Balance Amount":"120, 120, 120","Type":"Education Loan, Education Loan, Education Loan","Responsibility":"","Past Due Amount":"0, 0, 0","High Credit":"2250, 2250, 2250","Credit Limit":"","Payment Amount":"","Date Opened":"03\/2011, 03\/2011, 03\/2011","Date Reported":"","Date of Last Activity":"","Past 7 yrs Late Payments":"","Internal Notes":"","SOL Clock":"","Dispute Instructions":"Please have this company provide evidence of what they are currently reporting. Your Recorders are not consistent because there should be no negative information reporting. Please remove late payment and verbiage indicating that because it's not accurate.","Interviewer":"Missing","Action":"IN DISPUTE, IN DISPUTE, IN DISPUTE","Status":"Negative, Negative, Negative","History":[{"Sent_on":" 4\/22\/2015 7:04 AM ","To":" Equifax ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:12 AM ","To":" Experian ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:19 AM ","To":" TransUnion ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" Equifax, Experian, TransUnion "},{"Item Name":"FEDLOAN - 8222283518FD0XXXX","Account Number":"8222283518FD0XXXX, 8222283518FD0XXXX, 8222283518FD0XXXX","Balance Amount":"7511, 7511, 7511","Type":"Education Loan, Education Loan, Education Loan","Responsibility":"","Past Due Amount":"57, 57, 57","High Credit":"3500, 3500, 3500","Credit Limit":"","Payment Amount":"","Date Opened":"06\/2010, 06\/2010, 06\/2010","Date Reported":"","Date of Last Activity":"","Past 7 yrs Late Payments":"","Internal Notes":"","SOL Clock":"","Dispute Instructions":"Please have your best investigator work on this because it's reporting late payments that were under forbearance agreement and under that agreement the payments are suppose to be reporting on time or not at all. Please show all payments as current or remove them all together.","Interviewer":"Missing","Action":"IN DISPUTE, IN DISPUTE, IN DISPUTE","Status":"Negative, Negative, Negative","History":[{"Sent_on":" 4\/22\/2015 7:04 AM ","To":" Equifax ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:12 AM ","To":" Experian ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:19 AM ","To":" TransUnion ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" Equifax, Experian, TransUnion "}],"Collection":[{"Item Name":" ARS - 00000000000000XXXX ","Order":"Equifax, Experian, TransUnion","Account Number":"00000000000000XXXX","Original Creditor":"ARS","Status":"&nbsp;, &nbsp;, Negative","Balance Amount":"398","Date Opened":"02\/2011","Date Reported":"","Date of Last Activity":"","Internal Notes":" ","SOL Clock":" ","Dispute Instructions":" Investigate this item and provide your contact information used before further action may be needed. ","Action":"&nbsp;, &nbsp;, IN DISPUTE","History":[{"Sent_on":" 4\/22\/2015 7:19 AM ","To":" TransUnion ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" TransUnion "},{"Item Name":" ARS ACCOUNT RESOLUTION - 6945530400000000XXXX ","Order":"Equifax, Experian, TransUnion","Account Number":"6945530400000000XXXX, 6945530400000000XXXX","Original Creditor":"ARS ACCOUNT RESOLUTION, ARS ACCOUNT RESOLUTION","Status":"Negative, Negative, &nbsp;","Balance Amount":"398, 398","Date Opened":"02\/2011, 02\/2011","Date Reported":"","Date of Last Activity":"","Internal Notes":" ","SOL Clock":" ","Dispute Instructions":" Provide proof of this or it needs to be deleted. ","Action":"IN DISPUTE, IN DISPUTE, &nbsp;","History":[{"Sent_on":" 4\/22\/2015 7:04 AM ","To":" Equifax ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:12 AM ","To":" Experian ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" Equifax, Experian "},{"Item Name":" ENHANCRCVRCO - 10082XXXX ","Order":"Equifax, Experian, TransUnion","Account Number":"10082XXXX, 10082XXXX, 10082XXXX","Original Creditor":"ENHANCED RECOVERY CO L, ENHANCED RECOVERY CO L, ENHANCED RECOVERY CO L","Status":"Negative, Negative, Negative","Balance Amount":"247, 247, 247","Date Opened":"04\/2014, 04\/2014, 04\/2014","Date Reported":"","Date of Last Activity":"","Internal Notes":" ","SOL Clock":" ","Dispute Instructions":" This should not be reporting and needs to be deleted. There was no money owed to this company. ","Action":"IN DISPUTE, IN DISPUTE, IN DISPUTE","History":[{"Sent_on":" 4\/22\/2015 7:04 AM ","To":" Equifax ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:12 AM ","To":" Experian ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:19 AM ","To":" TransUnion ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" Equifax, Experian, TransUnion "},{"Item Name":" ENHANCRCVRCO - 11301XXXX ","Order":"Equifax, Experian, TransUnion","Account Number":"11301XXXX, 11301XXXX, 11301XXXX","Original Creditor":"ENHANCED RECOVERY CO L, ENHANCED RECOVERY CO L, ENHANCED RECOVERY CO L","Status":"Negative, Negative, Negative","Balance Amount":"367, 367, 367","Date Opened":"11\/2014, 11\/2014, 11\/2014","Date Reported":"","Date of Last Activity":"","Internal Notes":" ","SOL Clock":" ","Dispute Instructions":" This never went to collections and this inaccurate, untrue information needs to be deleted ASAP. ","Action":"IN DISPUTE, IN DISPUTE, IN DISPUTE","History":[{"Sent_on":" 4\/22\/2015 7:04 AM ","To":" Equifax ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:12 AM ","To":" Experian ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:19 AM ","To":" TransUnion ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" Equifax, Experian, TransUnion "},{"Item Name":" UNIV OF PHOENIX - 903732XXXX ","Order":"Equifax, Experian, TransUnion","Account Number":"903732XXXX, 903732XXXX","Original Creditor":"UNIVERSITY OF PHOENIX, UNIVERSITY OF PHOENIX","Status":"Negative, Negative, &nbsp;","Balance Amount":"1256, 1256","Date Opened":"06\/2010, 06\/2010","Date Reported":"","Date of Last Activity":"","Internal Notes":" ","SOL Clock":" ","Dispute Instructions":" Provide proof of this or it needs to be deleted. ","Action":"IN DISPUTE, IN DISPUTE, &nbsp;","History":[{"Sent_on":" 4\/22\/2015 7:04 AM ","To":" Equifax ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:12 AM ","To":" Experian ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" Equifax, Experian "}]}

doc={"_id":"FrPLYb7vzxvnfw8vE","authorID":"rLtoDqtXqTLXFRJPh","clientID":"T8AXCy6xqa3wauh9W","furnisher":"Hamilton Account Service ","instructions":"The account type for this entry is incorrect. I do not recall opening this and unless you can provide me proof that this account is mine and reporting accurately I want this deleted from your records.","itemData":{"incorrectAddress":{"equifax":{"address":"1","city":"2","itemStatus":"repaired","state":"3","zip":"4"},"experian":{"address":"11","city":"22","state":"33","zip":"44"},"transunion":{"address":"111","city":"222","state":"333","zip":"444"}}},"itemName":"Address","itemType":"incorrectAddress"}

@arr={}
duplicates=0
count=0;
$.each(uploadData, (i, el)->
  arr[i]={}
  $.each(el, (i2, el2)->
    console.log el2
  )
)
#console.log arr

#console.log uploadData, doc###
