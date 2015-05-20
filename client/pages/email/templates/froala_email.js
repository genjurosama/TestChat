Template.afFroalaEmail.onRendered(function(){
	
	this.$('textarea')
	this.$('textarea').editable({
	inlineMode: false,
	buttons: ['bold', 'italic', 'underline', 'customerVariables', 'recipientVariables'],
	height: '400',
	customDropdowns: {
    customerVariables: {
      title: 'Customer Variables',
      icon: {
        type: 'font',
        value: 'fa fa-plus-square',
      },
      options: {
        'Signature': function () {
          this.insertHTML('[c.signature]');
        },
        'First Name': function () {
          this.insertHTML('[c.fname]');
        },
        'Last Name': function () {
          this.insertHTML('[c.surname]');
        },
        'SSN': function () {
          this.insertHTML('[c.ssn]');
        },
        'DOB': function () {
          this.insertHTML('[c.dob]');
        },
        'Address Line 1': function () {
          this.insertHTML('[c.addr1]');
        },
        'Address Line 2': function () {
          this.insertHTML('[c.addr2]');
        },
        'City': function () {
          this.insertHTML('[c.city]');
        },
        'State': function () {
          this.insertHTML('[c.state]');
        },
        'Zip': function () {
          this.insertHTML('[c.zip]');
        },
        'Phone 1': function () {
          this.insertHTML('[c.phonvalue="{{this.value}}" {{this.atts}}e1]');
        },
        'Phone 2': function () {
          this.insertHTML('[c.phone2]');
        },
        'Fax': function () {
          this.insertHTML('[c.fax]');
        }
      },
      refresh: function () {
        // This method is called when the state of the button might have been changed.
      },
      refreshOnShow: function () {
        // This method is called when the dropdown context menu is shown.
      }
    },
    recipientVariables: {
      title: 'Recipient Variables',
      icon: {
        type: 'font',
        value: 'fa fa-plus-square',
      },
      options: {
        'Name': function () {
          this.insertHTML('[r.name]');
        },
        'Address 1': function () {
          this.insertHTML('[r.addr1]');
        },
        'Address 2': function () {
          this.insertHTML('[r.addr2]');
        },
        'City': function () {
          this.insertHTML('[r.city]');
        },
        'State': function () {
          this.insertHTML('[r.state]');
        },
        'Zip': function () {
          this.insertHTML('[r.zip]');
        },
        'Phone 1': function () {
          this.insertHTML('[r.phone1]');
        },
        'Phone 2': function () {
          this.insertHTML('[r.phone2]');
        },
        'Fax': function () {
          this.insertHTML('[r.fax]');
        }
      }
    }
  }
});

});

AutoForm.addInputType('froalaEmail', {
		template:"afFroalaEmail",
		valueOut: function(){
			console.log(this);
			return $(this).editable('getHTML', true, true);
		}
});