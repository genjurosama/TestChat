Template.afFroalaEmail.onRendered(function(){
  var id = this.data.atts.id;
  
  var afOptions = this.data.atts.froalaOptions;
  var froalaSkel = froalaSkeleton;


  froalaSkel.customDropdowns = afOptions.customDropdowns;

  _.each(froalaSkel.customDropdowns, function(a){
    console.log("Dropdown");
    _.each(a.options, function(opt){
      opt = "meh";
    });
  });

  // Old render
  //$('#'+id).editable(this.data.atts.froalaOptions);
  // New render

  console.log(froalaSkel);
  $('#'+id).editable(froalaSkel);
});

Template.afFroalaEmail.helpers({
  atts: function(){
    var atts = _.clone(this.atts);

    // Remove froalaOptions so doesn't get rendered as html attrib
    delete atts.froalaOptions;
    return atts;
  }
});

AutoForm.addInputType('froalaEmail', {
		template:"afFroalaEmail",
		valueOut: function(){
			return $(this).editable('getHTML', true, true);
		}
    //TODO: Implement valueIn
});