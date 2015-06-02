Meteor.subscribe("colForms");
Template.editbuilder.rendered = function(){

      currentform = this.data;

      $("#formname").text(currentform.name);
      $("#url").val(Meteor.absoluteUrl()+"form/"+currentform._id);
      $("#url").prop('disabled', true);
       $(document).ready(function() {
         $('#formname').editable();
         $('#formname').on('save', function(e, params) {
           console.log($("#formname").text());
           colForms.update(currentform._id, {$set: {name: params.newValue}});

         });
      });
      fb = new Formbuilder({
        selector: '.fb-main',
        bootstrapData: currentform.fields
      });
      for(var i=0;i<currentform.tags.length;i++) {
        $('#inputTags').val(currentform.tags[i]+","+$('#inputTags').val());
      }
      $('#inputTags').tagsinput("items");

      fb.on('save', function(payload){

        formName =$("#formname").text();
        formUrl = $("#url").val();
        currentform.name=formName;
        currentform.url=formUrl;
        currentform.tags= $("#inputTags").val().split(",");
        console.log(payload);
        tab = payload;
        if (typeof ( form = colForms.findOne({_id:currentform._id}) ) == 'undefined'){
           form = colForms.insert({_id:currentform._id,fields:JSON.parse(tab).fields,tags:currentform.tags,name:currentform.name,url:currentform.formUrl});

         }
        else{
            console.log("updating");
            colForms.update(currentform._id, {$set: {fields:JSON.parse(tab).fields,tags:currentform.tags,name: currentform.name,url:currentform.formUrl}});
            debouncedEvent = _.debounce(function(form){createEditEvent(form);}, 5000);
            debouncedEvent(currentform);
        }

      })

}

function createEditEvent(formulaire){
      event = new Object();
      event.date =  moment().toDate();
      event.type =  "edit";
      event.formid = formulaire._id;
      event.formName=currentform.name;
      event.username =Meteor.user().profile.firstname;
      event.formSnap = formulaire;
      events.insert(event);
      console.log(event);
    }

Template.builder.helpers({
  "getFormId":function(){
    return formulaire.id;
  }

});

