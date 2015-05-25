Template.auditStep4.events
  'click .btn-save-item': ()->
    doc = {
      "clientID": $("#clientID").val()
      "authorID": Meteor.userId()
      "reportSource": $("#reportSource").val()
      "reportDate": $("#reportDate").datepicker("getDate")
      "creditScores": {}
      "numberOfInquiries": {}
      "personalInformation": {}
      "creditGrades": {}
      "conclusion": $("#description").val()
      "description": $("#description").val()
    }
    $.each creditBureaus, (k,v)->
      doc.creditScores[k]= $("#score_"+k).val()
      doc.numberOfInquiries[k]= $("#inquiries_"+k).val()
      doc.creditGrades[k]= $("#grade_"+k).val()

    $.each auditTest, (k, item)->
      val = $("input[name="+item.key+"]:checked").attr("answ")
      if !val
        val = false
      doc.personalInformation[item.key] = {answer: val, data: {}}
      $.each creditBureaus, (k,v)->
        doc.personalInformation[item.key].data[k] = $("#"+item.key+"_"+k).val()

    Meteor.call 'addClientAudit', doc, (err, resp)->
      if err
        Bert.alert(err.reason, 'danger');
      else
        Bert.alert("Success", 'success');
        Router.go("clientAudit", {_id: $("#clientID").val()})
Template.auditStep3.helpers
  getAccountsData: ()->
    globalData = []
    ratioData = {}
    returnData = {}
    itemData = colClientItems.find({clientID: this._id, auditPath: {$exists: true}}).fetch()
    $.each itemData, (k,item)->
      accountType = item.auditPath.split("  >  ")[0]
      if !returnData[accountType]
        returnData[accountType] = {accountType: accountType, data:[]}
      ind = returnData[accountType].data.length
      returnData[accountType].data[ind] = {name: item.itemName, statuses: []}
      bData = item.itemData[item.itemType]
      $.each creditBureaus, (k,v)->
        bureauData = bData[k]
        if !bureauData
          bureauData = {}
        if bureauData.accountNumber
          returnData[accountType].data[ind].number = bureauData.accountNumber
        if !bureauData.itemStatus
          bureauData.itemStatus = "negative"
        if !ratioData[k]
          ratioData[k]=0
        ratio = 0
        if bureauData.balanceAmount && bureauData.creditLimit
          ratio = (bureauData.balanceAmount/bureauData.creditLimit)*100
        ratioData[k] = (ratioData[k]+ratio)/2
        returnData[accountType].data[ind].statuses.push(itemStatuses[bureauData.itemStatus])
    returnData = $.map returnData, (value, index) ->
      value.key =  index
      [ value ]
    ratioData = $.map ratioData, (value, index) ->
      [ value ]
    globalData.push({items: returnData, ratios: [{ratioData: ratioData}]})
    return globalData

Template.auditStep2.helpers
  testLabel: (txt)->
    return txt
  auditTest: ()->
    return auditTest

Template.clientAuditCreate.rendered = ()->
  theData = this.data
  $(()->


    $('#auditWizard').wizard();
    $('.btn-next2').click(()->
      $('#auditWizard').wizard("next");
    )
    $('.btn-prev2').click(()->
      $('#auditWizard').wizard("previous");
    )

    $('input').iCheck {checkboxClass: 'icheckbox_flat-green',radioClass: 'iradio_flat-green'}

    $(".audit-test input[type=radio]").on('ifChecked', (event)->

      if  $(this).attr("subtype")=="accuracy"
        if $(this).attr("answ")=="n"
          $("#div_"+$(this).attr("name")).show()
        else
          $("#div_"+$(this).attr("name")).hide()

      if $(this).attr("subtype")=="quantity"
        if $(this).attr("answ")=="y"
          $("#div_"+$(this).attr("name")).show()
        else
          $("#div_"+$(this).attr("name")).hide()

    )


    $('#auditWizard').on('changed.fu.wizard', (evt)->
      step = $('#auditWizard').wizard('selectedItem').step
      error=false

      if step==3
        $.each creditBureaus, (k,v)->
          $("#cs_"+k+"_container").html($("#score_"+k).val())
          $("#inq_"+k+"_container").html($("#inquiries_"+k).val())



      if error
        $('#auditWizard').wizard("previous")
        Bert.alert(error, 'danger');
    );
  )


