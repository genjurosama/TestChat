
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






      if error
        $('#auditWizard').wizard("previous")
        Bert.alert(error, 'danger');
    );
  )


