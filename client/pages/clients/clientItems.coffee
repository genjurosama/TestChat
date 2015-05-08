Template.itemStep1.helpers
  selectizeOptions: () ->
    arrInstructions=[]
    colAdminSystem.find({name: "dropDowns"}).fetch()[0].instructions.forEach((element)->
      arrInstructions.push({text: element.name, value: element.name})
    )
    return {
      valueField: 'value'
      labelField: 'text'
      options: arrInstructions
      create: true
    }
  settings: () ->
    return {
      position: 'bottom'
      limit: 10
      rules: [
        {
          collection: colFurhishers
          field: 'name'
          template: Template.furnisherPill
        }

      ]
    }
Template.itemStep2.helpers
  creditBureaus: ()->
    return $.map creditBureaus, (value, index) ->
      value.key =  index
      [ value ]
Template.clientItems.rendered = ()->
  $(()->
    $('#MyWizard').wizard();
    $('.btn-next2').click(()->
      $('#MyWizard').wizard("next");
    )
    $('.btn-prev2').click(()->
      $('#MyWizard').wizard("previous");
    )
    $('#MyWizard').on('changed.fu.wizard', (evt)->
      step = $('#MyWizard').wizard('selectedItem').step
      error=false

      itemType = $("#itemType").val()

      if step>1
        if !itemType
          error = "Please select type of the item"
        if !$("#itemName").val()
          error = "Please enter title of the item"
      if step==3
        bureaus = $('input[name="bureaus[]"]:checked').map(->
          if $(this).val()
            return $(this).val()
          return
        ).get()
        if bureaus.length<1
          error = "Please select at least 1 bureau"
        console.log bureaus


      if error && 1==3
        $('#MyWizard').wizard("previous")
        Bert.alert(error, 'danger');
    );
  )
capitalizeFirstLetter = (str)->
  return str.charAt(0).toLowerCase() + str.slice(1);



@testData={"Incorrect Names":[{"Item Name":"DAVID BROWN","Order":"Equifax, Experian, TransUnion","Incorrect Name":"DAVID BROWN, DAVID BROWN, DAVID BROWN","Dispute Instructions":" Evidence has been given to your company with the correct name and spelling all other listings are incorrect and need to be deleted. ","Interviewer":" Missing ","Action":"IN DISPUTE, IN DISPUTE, IN DISPUTE","Status":"Negative, Negative, Negative","History":[{"Sent_on":" 4\/22\/2015 7:04 AM ","To":" Equifax ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:12 AM ","To":" Experian ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:19 AM ","To":" TransUnion ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" Equifax, Experian, TransUnion "}],"Incorrect Address":[{"Item Name":"105 OAKRIDGE WY 6, SHEPHERDSVILLE, KY 40165","Order":"Equifax, Experian, TransUnion","Address":"105 OAKRIDGE WY 6","City":"SHEPHERDSVILLE","State":"KY","Zip Code":"40165","Dispute Instructions":"There has been no residency at this address, please delete","Action":" IN DISPUTE ","Status":" Negative ","History":[{"Sent_on":" 4\/22\/2015 7:19 AM ","To":" TransUnion ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" TransUnion "},{"Item Name":"300 TYLER PKWY, SHEPHERDSVILLE, KY 40165","Order":"Equifax, Experian, TransUnion","Address":"300 TYLER PKWY, 300 TYLER PKWY","City":"SHEPHERDSVILLE, SHEPHERDSVILLE","State":"KY, KY","Zip Code":"40165, 40165","Dispute Instructions":"There has been no residency at this address, please delete","Action":" IN DISPUTE IN DISPUTE ","Status":" Negative Negative ","History":[{"Sent_on":" 4\/22\/2015 7:04 AM ","To":" Equifax ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:12 AM ","To":" Experian ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" Equifax, Experian "},{"Item Name":"FEDLOAN","Order":"Equifax, Experian, TransUnion","Address":"430 TYLER PKWY, 430 TYLER PKWY, 430 TYLER PKWY","City":"SHEPHERDSVILLE, SHEPHERDSVILLE, SHEPHERDSVILLE","State":"KY, KY, KY","Zip Code":"40165, 40165, 40165","Dispute Instructions":"There has been no residency at this address, please delete","Action":" IN DISPUTE IN DISPUTE IN DISPUTE ","Status":" Negative Negative Negative ","History":[{"Sent_on":" 4\/22\/2015 7:04 AM ","To":" Equifax ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:12 AM ","To":" Experian ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:19 AM ","To":" TransUnion ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" Equifax, Experian, TransUnion "},null],"Account":[{"Item Name":"FEDLOAN - 8222283518FD0XXXX","Account Number":"8222283518FD0XXXX, 8222283518FD0XXXX, 8222283518FD0XXXX","Balance Amount":"3894, 3894, 3894","Type":"Education Loan, Education Loan, Education Loan","Responsibility":"","Past Due Amount":"0, 0, 0","High Credit":"6000, 6000, 6000","Credit Limit":"","Payment Amount":"28, 28, 28","Date Opened":"06\/2010, 06\/2010, 06\/2010","Date Reported":"","Date of Last Activity":"","Past 7 yrs Late Payments":"","Internal Notes":"","SOL Clock":"","Dispute Instructions":"Please note that payments are not reporting accurately. The account was never late and should report accurately. Please show as paid as agreed and remove all references to every being delinquent.","Interviewer":"Missing","Action":"IN DISPUTE, IN DISPUTE, IN DISPUTE","Status":"Negative, Negative, Negative","History":[{"Sent_on":" 4\/22\/2015 7:04 AM ","To":" Equifax ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:12 AM ","To":" Experian ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:19 AM ","To":" TransUnion ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" Equifax, Experian, TransUnion "},{"Item Name":"FEDLOAN - 8222283518FD0XXXX","Account Number":"8222283518FD0XXXX, 8222283518FD0XXXX, 8222283518FD0XXXX","Balance Amount":"2419, 2419, 2419","Type":"Education Loan, Education Loan, Education Loan","Responsibility":"","Past Due Amount":"0, 0, 0","High Credit":"121, 121, 121","Credit Limit":"","Payment Amount":"","Date Opened":"03\/2011, 03\/2011, 03\/2011","Date Reported":"","Date of Last Activity":"","Past 7 yrs Late Payments":"","Internal Notes":"","SOL Clock":"","Dispute Instructions":"The dates you are reporting this account as being late the payments were actually in deferment. Payments are not to be reporting late under this agreement. Please see that this is corrected as quickly as possible.","Interviewer":"Missing","Action":"IN DISPUTE, IN DISPUTE, IN DISPUTE","Status":"Negative, Negative, Negative","History":[{"Sent_on":" 4\/22\/2015 7:04 AM ","To":" Equifax ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:12 AM ","To":" Experian ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:19 AM ","To":" TransUnion ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" Equifax, Experian, TransUnion "},{"Item Name":"FEDLOAN - 8222283518FD0XXXX","Account Number":"8222283518FD0XXXX, 8222283518FD0XXXX, 8222283518FD0XXXX","Balance Amount":"120, 120, 120","Type":"Education Loan, Education Loan, Education Loan","Responsibility":"","Past Due Amount":"0, 0, 0","High Credit":"2250, 2250, 2250","Credit Limit":"","Payment Amount":"","Date Opened":"03\/2011, 03\/2011, 03\/2011","Date Reported":"","Date of Last Activity":"","Past 7 yrs Late Payments":"","Internal Notes":"","SOL Clock":"","Dispute Instructions":"Please have this company provide evidence of what they are currently reporting. Your Recorders are not consistent because there should be no negative information reporting. Please remove late payment and verbiage indicating that because it's not accurate.","Interviewer":"Missing","Action":"IN DISPUTE, IN DISPUTE, IN DISPUTE","Status":"Negative, Negative, Negative","History":[{"Sent_on":" 4\/22\/2015 7:04 AM ","To":" Equifax ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:12 AM ","To":" Experian ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:19 AM ","To":" TransUnion ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" Equifax, Experian, TransUnion "},{"Item Name":"FEDLOAN - 8222283518FD0XXXX","Account Number":"8222283518FD0XXXX, 8222283518FD0XXXX, 8222283518FD0XXXX","Balance Amount":"7511, 7511, 7511","Type":"Education Loan, Education Loan, Education Loan","Responsibility":"","Past Due Amount":"57, 57, 57","High Credit":"3500, 3500, 3500","Credit Limit":"","Payment Amount":"","Date Opened":"06\/2010, 06\/2010, 06\/2010","Date Reported":"","Date of Last Activity":"","Past 7 yrs Late Payments":"","Internal Notes":"","SOL Clock":"","Dispute Instructions":"Please have your best investigator work on this because it's reporting late payments that were under forbearance agreement and under that agreement the payments are suppose to be reporting on time or not at all. Please show all payments as current or remove them all together.","Interviewer":"Missing","Action":"IN DISPUTE, IN DISPUTE, IN DISPUTE","Status":"Negative, Negative, Negative","History":[{"Sent_on":" 4\/22\/2015 7:04 AM ","To":" Equifax ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:12 AM ","To":" Experian ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:19 AM ","To":" TransUnion ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" Equifax, Experian, TransUnion "}],"Collection":[{"Item Name":" ARS - 00000000000000XXXX ","Order":"Equifax, Experian, TransUnion","Account Number":"00000000000000XXXX","Original Creditor":"ARS","Status":" ,  , Negative","Balance Amount":"398","Date Opened":"02\/2011","Date Reported":"","Date of Last Activity":"","Internal Notes":" ","SOL Clock":" ","Dispute Instructions":" Investigate this item and provide your contact information used before further action may be needed. ","Action":" ,  , IN DISPUTE","History":[{"Sent_on":" 4\/22\/2015 7:19 AM ","To":" TransUnion ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" TransUnion "},{"Item Name":" ARS ACCOUNT RESOLUTION - 6945530400000000XXXX ","Order":"Equifax, Experian, TransUnion","Account Number":"6945530400000000XXXX, 6945530400000000XXXX","Original Creditor":"ARS ACCOUNT RESOLUTION, ARS ACCOUNT RESOLUTION","Status":"Negative, Negative,  ","Balance Amount":"398, 398","Date Opened":"02\/2011, 02\/2011","Date Reported":"","Date of Last Activity":"","Internal Notes":" ","SOL Clock":" ","Dispute Instructions":" Provide proof of this or it needs to be deleted. ","Action":"IN DISPUTE, IN DISPUTE,  ","History":[{"Sent_on":" 4\/22\/2015 7:04 AM ","To":" Equifax ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:12 AM ","To":" Experian ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" Equifax, Experian "},{"Item Name":" ENHANCRCVRCO - 10082XXXX ","Order":"Equifax, Experian, TransUnion","Account Number":"10082XXXX, 10082XXXX, 10082XXXX","Original Creditor":"ENHANCED RECOVERY CO L, ENHANCED RECOVERY CO L, ENHANCED RECOVERY CO L","Status":"Negative, Negative, Negative","Balance Amount":"247, 247, 247","Date Opened":"04\/2014, 04\/2014, 04\/2014","Date Reported":"","Date of Last Activity":"","Internal Notes":" ","SOL Clock":" ","Dispute Instructions":" This should not be reporting and needs to be deleted. There was no money owed to this company. ","Action":"IN DISPUTE, IN DISPUTE, IN DISPUTE","History":[{"Sent_on":" 4\/22\/2015 7:04 AM ","To":" Equifax ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:12 AM ","To":" Experian ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:19 AM ","To":" TransUnion ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" Equifax, Experian, TransUnion "},{"Item Name":" ENHANCRCVRCO - 11301XXXX ","Order":"Equifax, Experian, TransUnion","Account Number":"11301XXXX, 11301XXXX, 11301XXXX","Original Creditor":"ENHANCED RECOVERY CO L, ENHANCED RECOVERY CO L, ENHANCED RECOVERY CO L","Status":"Negative, Negative, Negative","Balance Amount":"367, 367, 367","Date Opened":"11\/2014, 11\/2014, 11\/2014","Date Reported":"","Date of Last Activity":"","Internal Notes":" ","SOL Clock":" ","Dispute Instructions":" This never went to collections and this inaccurate, untrue information needs to be deleted ASAP. ","Action":"IN DISPUTE, IN DISPUTE, IN DISPUTE","History":[{"Sent_on":" 4\/22\/2015 7:04 AM ","To":" Equifax ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:12 AM ","To":" Experian ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:19 AM ","To":" TransUnion ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" Equifax, Experian, TransUnion "},{"Item Name":" UNIV OF PHOENIX - 903732XXXX ","Order":"Equifax, Experian, TransUnion","Account Number":"903732XXXX, 903732XXXX","Original Creditor":"UNIVERSITY OF PHOENIX, UNIVERSITY OF PHOENIX","Status":"Negative, Negative,  ","Balance Amount":"1256, 1256","Date Opened":"06\/2010, 06\/2010","Date Reported":"","Date of Last Activity":"","Internal Notes":" ","SOL Clock":" ","Dispute Instructions":" Provide proof of this or it needs to be deleted. ","Action":"IN DISPUTE, IN DISPUTE,  ","History":[{"Sent_on":" 4\/22\/2015 7:04 AM ","To":" Equifax ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "},{"Sent_on":" 4\/22\/2015 7:12 AM ","To":" Experian ","Round":" ","Letter":" Active ","Dispute Result":" None ","Result Date":" N\/A ","Status":" Open ","Enterred By":" N\/A "}],"Reported":" Equifax, Experian "}]}

@arr={}
duplicates=0
count=0;
$.each(testData, (i, el)->
  arr[i]={}
  obj = el[0]
  console.log obj
  $.each(obj, (i2, el2)->
    r = new RegExp("/ /","g")
    item = capitalizeFirstLetter(i2.split(" ").join(""))
    if arr[i][item]
      duplicates++
    count++
    arr[i][item]={type: "String"}
  )
)
console.log JSON.stringify(arr, null, ' ')

