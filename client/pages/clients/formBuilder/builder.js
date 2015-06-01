formulaire = new Object();
Meteor.subscribe("forms");
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
    },
    "getTemplates":function(){
        return templates.find({});
    }

});

Template.builder.events({

    "change #selectTemplate":function(e){
        template=templates.findOne({_id:$(e.target).val()});
        console.log(template);
        fb.fields=template.field;
    },
    "change #inputTags":function(e){
        $('#inputTags').tagsinput("items");
        formulaire.id = Random.id();
    }
});
