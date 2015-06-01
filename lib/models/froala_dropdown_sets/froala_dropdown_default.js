froalaDropdownsDefault = {
  // --- Froala Editor Options
  inlineMode: false,
  buttons: ['bold', 'italic', 'underline'],
  height: '400',

  // --- Dropdown Options
  customerVariables: {
    title: 'Customer Variables',
    icon: {
      type: 'font',
      value: 'fa fa-cart-plus',
    },
    options: {
      'Signature': '[Customer First Name] [Customer Last Name]<br/>[Customer SSN]<br/>[Customer DOB]<br/>[Customer Address Line 1]<br/>[Customer Address Line 2]<br/>[Customer City], [Customer State]  [Customer Zip]',
      'First Name': '[Customer First Name]',
      'Last Name': '[Customer Last Name]',
      'SSN':'[Customer SSN]',
      'DOB':'[Customer DOB]',
      'Address Line 1':'[Customer Address Line 1]',
      'Address Line 2':'[Customer Address Line 2]',
      'City, State, Zip':'[Customer City], [Customer State] [Customer Zip]',
      'Phone 1':'[Customer Phone 1]',
      'Phone 2':'[Customer Phone 2]',
      'Fax':'[Customer Fax]'
    }
  },
  recipientVariables: {
    title: 'Recipient Variables',
    icon: {
      type: 'font',
      value: 'fa fa-inbox',
    },
    options: {
      'Name':'[Recipient Name]',
      'Address 1':'[Recipient Address Line 1]',
      'Address 2':'[Recipient Address Line 2]',
      'City, State, Zip':'[Recipient City], [Recipient State] [Recipient Zip]',
      'Phone':'[Recipient Phone]',
      'Fax':'[Recipient Fax]',
    }
  },
  creditReportVariables: {
    title: 'Credit Report Card Variables',
    icon: {
      type: 'font',
      value: 'fa fa-plus-circle',
    },
    options: {
      'Item List':'[Recipient Name]',
      'Item List With Dispute Instructions':'[Item List With Dispute Instructions]'
    }
  },
  miscVariables: {
    title: 'Misc Variables',
    icon: {
      type: 'font',
      value: 'fa fa-plus-square',
    },
    options: {
      'Current Date':'[Current Date]'
    }
  }
}
