Template.afFroalaEmail.onRendered(function(){
	
	this.$('textarea')
	this.$('textarea').editable({
	inlineMode: false,
	buttons: ['bold', 'italic', 'underline', 'customerVariables', 'recipientVariables', 'miscVariables'],
	height: '400',
	customDropdowns: {
    customerVariables: {
      title: 'Customer Variables',
      icon: {
        type: 'font',
        value: 'fa fa-cart-plus',
      },
      options: {
        'Signature': function () {
          this.insertHTML('[Customer First Name] [Customer Last Name]<br/>[Customer SSN]<br/>[Customer DOB]<br/>[Customer Address Line 1]<br/>[Customer Address Line 2]<br/>[Customer City], [Customer State]  [Customer Zip]');
        },
        'First Name': function () {
          this.insertHTML('[Customer First Name]');
        },
        'Last Name': function () {
          this.insertHTML('[Customer Last Name]');
        },
        'SSN': function () {
          this.insertHTML('[Customer SSN]');
        },
        'DOB': function () {
          this.insertHTML('[Customer DOB]');
        },
        'Address Line 1': function () {
          this.insertHTML('[Customer Address Line 1]');
        },
        'Address Line 2': function () {
          this.insertHTML('[Customer Address Line 2]');
        },
        'City, State, Zip': function () {
          this.insertHTML('[Customer City], [Customer State] [Customer Zip]');
        },
        'Phone 1': function () {
          this.insertHTML('[Customer Phone 1]');
        },
        'Phone 2': function () {
          this.insertHTML('[Customer Phone 2]');
        },
        'Fax': function () {
          this.insertHTML('[Customer Fax]');
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
        value: 'fa fa-inbox',
      },
      options: {
        'Name': function () {
          this.insertHTML('[Recipient Name]');
        },
        'Address 1': function () {
          this.insertHTML('[Recipient Address Line 1]');
        },
        'Address 2': function () {
          this.insertHTML('[Recipient Address Line 2]');
        },
        'City, State, Zip': function () {
          this.insertHTML('[Recipient City], [Recipient State] [Recipient Zip]');
        },
        'Phone': function () {
          this.insertHTML('[Recipient Phone]');
        },
        'Fax': function() {
          this.insertHTML('[Recipient Fax]');
        }
      }
    },
    creditReportVariables: {
      title: 'Credit Report Card Variables',
      icon: {
        type: 'font',
        value: 'fa fa-plus-circle',
      },
      options: {
        'Item List': function () {
          this.insertHTML('[Recipient Name]');
        },
        'Item List With Dispute Instructions': function () {
          this.insertHTML('[Item List With Dispute Instructions]');
        }
      }
    },
    miscVariables: {
      title: 'Misc Variables',
      icon: {
        type: 'font',
        value: 'fa fa-plus-square',
      },
      options: {
        'Current Date': function () {
          this.insertHTML('[Current Date]');
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