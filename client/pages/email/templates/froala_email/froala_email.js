Template.afFroalaEmail.onRendered(function(){
  var id = this.data.atts.id;
  var afDropdownOptions = this.data.atts.froalaOptions;
  var froala_skel = froalaSkeleton;

  // Assign basic editor variables
  froala_skel.height = afDropdownOptions.height;
  froala_skel.inlineMode = afDropdownOptions.inlineMode;
  froala_skel.buttons = afDropdownOptions.buttons;

  // Delete basic editor variables
  delete afDropdownOptions.inlineMode;
  delete afDropdownOptions.height;

  // Make sure all dropdowns are added to buttons
  Object.keys(afDropdownOptions).forEach(function(key){
      froala_skel.buttons.push(key);
  });

  // Make sure to remove anything else before dropdown generation begins
  delete afDropdownOptions.buttons;

  // Assign dropdowns
  froala_skel.customDropdowns = afDropdownOptions;

  // Convert each of the dropdowns options from string to function format
  froala_skel.customDropdowns = convertDropdowns(froala_skel.customDropdowns);

  // Enable editor using converted skeleton data
  $('#'+id).editable(froala_skel);
});


Template.afFroalaEmail.helpers({
  atts: function(){
    var atts = _.clone(this.atts);

    // Remove froalaOptions so doesn't get rendered as html attrib
    delete atts.froalaOptions;
    return atts;afDropdownOptions;
  }
});

AutoForm.addInputType('froalaEmail', {
		template:"afFroalaEmail",
		valueOut: function(){
			return $(this).editable('getHTML', true, true);
		}
    //TODO: Implement valueInfroala_skel.customDropdowns.customerVariables.options
});


// Converts options params from strings
// to functions
function convertDropdowns(dropdowns){
  Object.keys(dropdowns).forEach(function(val){
    dropdowns[val].options = convertOptions(dropdowns[val].options);
  });

  return dropdowns;
}

function convertOptions(options){
  var newOptions = Object.keys(options).reduce(function ( obj, option ) {
    obj[ option ] = function () {
      this.insertHTML(options[ option ]);
    };

    return obj;
  }, {});

  return newOptions;
}
