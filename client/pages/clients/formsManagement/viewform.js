Meteor.subscribe("colForms");


//  handle bar helper for equality
 UI.registerHelper('equals', function (a, b) {
      return a === b;
    });

 UI.registerHelper('getMonth', function (a) {
      locale = "en-us";
      month = a.toLocaleString(locale, { month: "short" });
      return month;
    });


Template.viewForm.rendered = function(){

    signature = false;
    currentForm = this.data;
    formHtml ="";
    signatures = new Array();
    trackedSignatures = new Array();
     // turning canvas into signable pad

    pads=document.querySelectorAll("canvas");
    for(var i=0;i<pads.length;i++){
      signature = new SignaturePad(pads[i]);
      trackedSignatures[pads[i].id]=signature;
      signatures.push(signature);
    }



  $('form').validate({
    rules: {
        'fname[]': {
            minlength: 3,
            maxlength: 15,
            required: true
        },
        'lname[]': {
            minlength: 3,
            maxlength: 15,
            required: true
        }
    },
    highlight: function(element) {
        var id_attr = "#" + $( element ).attr("id") + "1";
        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
        $(id_attr).removeClass('glyphicon-ok').addClass('glyphicon-remove');
    },
    unhighlight: function(element) {
        var id_attr = "#" + $( element ).attr("id") + "1";
        $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
        $(id_attr).removeClass('glyphicon-remove').addClass('glyphicon-ok');
    },
    errorElement: 'span',
        errorClass: 'help-block',
        errorPlacement: function(error, element) {
            if(element.length) {
                error.insertAfter(element);
            } else {
            error.insertAfter(element);
            }
        }
 });

  }

// retrieving all dynamic form elements  and put theme into field array
Template.viewForm.events({
  "submit form" : function(e){
   e.preventDefault();
   console.log(this);

   fieldArray = new Array();
   value = "";
   label = "";


    $("form").find('input,canvas,p,img').each(function(){
      field = new Object();
      label="";
      value="";
      if($(this).is("canvas") || $(this).is("p") || $(this).is("img") ){
        value =$(this).prop("outerHTML");
        label = $(this).parent().parent().find("label").text();

      }

      else{
        if($(this).is(":radio")|| $(this).is(":checkbox") ){
          if($(this).parent().hasClass("checked")) {
            value = $(this).val();
            label = $(this).parent().paren().find(".title").text();
            console.log(value);
            console.log(label);
          }
        }
        else if($(this).is(":radio") ||  $(this).is(":checkbox")){

        }
      else {
        value = $(this).val();
        label = $(this).parent().parent().find("label").text();
      }

      }
     field.value=value;
     field.label=label;
     fieldArray.push(field);
    });
    signedform = new Object();
    signedform.fields = fieldArray;
    signedform.name = currentForm.name;
    signedform.url = currentForm.url;
    signedform.status = "pending";
    signedform.originalformid = currentForm._id;
    signedform.owner = currentForm.uid;
    console.log(signedform);
    dataUrls = new Array();
    if(signature){
    //attaching the signature to the signedForm object to be displayed in the view signed form
    signedform.signatures = signatures;
    for (var i=0;i<signatures.length;i++){
      dataUrls.push(signatures[i].toDataURL());
      }
      signedform.signatures=dataUrls;
    }
    photoUrls = new Array();
    for (var i=0;i<signatures.length;i++){
      photoUrls.push($("#photo"+i).attr("src"));
      }
    signedform.imgUrls = photoUrls;
    event = new Object();
    event.date =  moment().toDate();
    event.type =  "submition";
    event.formid = this._id;
    event.formName = this.name;
    events.insert(event);
    console.log("created:"+event);
    signedforms.insert(signedform,function(err,result){
      if (err){
        Bert.alert('there was a problem'+err.reason, 'danger', 'growl-top-right');
      }else{
        Bert.alert('successfuly submited', 'success', 'growl-top-right');
      }
      console.log("result",result)
    });

  }

});



