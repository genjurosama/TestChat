
formulaire = new Object();
Meteor.subscribe("colForms");
Template.builder.rendered = function(){
  $('#inputTags').tagsinput("items");
  formulaire.id = Random.id();
  console.log("meteor id ");
  $("#url").val(Meteor.absoluteUrl()+"form/"+formulaire.id);
  $("#url").prop('disabled', true);
}

Template.builder.helpers({
  "getFormId":function(){
    console.log("called helper");
    console.log(formulaire);
    return formulaire.id;
  }

});

Template.builder.events({


  "change #inputTags":function(e){
    $('#inputTags').tagsinput("items");
    formulaire.id = Random.id();
  }
});



