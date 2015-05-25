Template.afFroalaEmail.onRendered(function(){
  console.log(this);
  var id = this.data.atts.id;
  $('#'+id).editable(this.data.atts.froalaOptions);
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