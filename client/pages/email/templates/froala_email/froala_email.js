Template.afFroalaEmail.onRendered(function(){
  var id = this.data.atts.id;
  
  var afOptions = this.data.atts.froalaOptions;

  // Enable editor
  $('#'+id).editable(afOptions);
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


// Converts options params from strings
// to functions
function convertOptions(options){
  var newOptions = Object.keys(options).reduce(function ( obj, option ) {
    obj[ option ] = function () {
      this.insertHTML(options[ option ]);
    };
    
    return obj;
  }, {});

  return newOptions;
}
