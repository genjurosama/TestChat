Template.afFroalaEmail.onRendered(function(){
  console.log(this);
  var id = this.data.atts.id;
  $('#'+id).editable({inlineMode: false});
});

AutoForm.addInputType('froalaEmail', {
		template:"afFroalaEmail",
		valueOut: function(){
			return $(this).editable('getHTML', true, true);
		}
});