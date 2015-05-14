@Schema.clientItem = new SimpleSchema(
  "clientID":
    type: String
  "authorID":
    type: String
  "itemStatus":
    optional: true
    type: String
  "itemType":
    type: String
    autoform:
      type: "select"
      options: ()->
        i=0
        opts=[]
        $.each(itemTypes, (key, value)->
          opts.push({label: value, value: key})
        )
        return opts
  "furnisher":
    optional: true
    type: String
  "instructions":
    optional: true
    type: String
    autoform:
      type: "selectize"
  "createdAt":
    type: Date
    autoValue: ()->
      if this.isInsert
        return moment().toDate()
  "itemName":
	  type: String
  "itemData":
    optional: true
    type: Object
  "itemData.incorrectName":
    optional: true
    type: Object
  "itemData.incorrectName.$":
    optional: true
    type: Object
    blackbox: true
  "itemData.incorrectSSN":
    optional: true
    type: Object
  "itemData.incorrectDOB":
    optional: true
    type: Object
  "itemData.incorrectAddress":
    optional: true
    type: Object
  "itemData.account":
    optional: true
    type: Object
  "itemData.collection":
    optional: true
    type: Object
  "itemData.inquiry":
    optional: true
    type: Object
  "itemData.publicRecord":
    optional: true
    type: Object
)

@Schema.itemIncorrectName = new SimpleSchema(
  "incorrectName": {
    "type": String
  },
  "internalNotes": {
    "type": String
    optional: true
    autoform:
      afFieldInput:
        type: "textarea"
  }
)

@Schema.itemIncorrectSSN = new SimpleSchema(
  "incorrectSSN": {
    "type": String
  },
  "internalNotes": {
    "type": String
    optional: true
    autoform:
      afFieldInput:
        type: "textarea"
  }
)

@Schema.itemIncorrectDOB = new SimpleSchema(
  birthday: {
    type: Date
    optional: true
    autoform:
      afFieldInput:
        type: "bootstrap-datepicker"
        datePickerOptions:
          autoclose: true
          viewMode: 'years'
  },
  "internalNotes": {
    "type": String
    optional: true
    autoform:
      afFieldInput:
        type: "textarea"
  }
)

@Schema.itemIncorrectAddress = new SimpleSchema(
  "address": {
    "type": String
  },
  "city": {
    "type": String
  },
  "state": {
    "type": String
  },
  "zip": {
    "type": String
  }
)

@Schema.itemAccount = new SimpleSchema(
  "accountNumber": {
    "type": String
  },
  "balanceAmount": {
    "type": String
  },
  "status": {
    "type": String
    autoform:
      type: "select"
      options: ()->
        data = colAdminSystem.findOne({name: "dropDowns"}).accountStatus
        data.map (c)->
          return {label: c, value: c}
  },
  "type": {
    "type": String
    autoform:
      type: "select"
      options: ()->
        data = colAdminSystem.findOne({name: "dropDowns"}).accountTypes
        data.map (c)->
          return {label: c, value: c}
  },
  "responsibility": {
    "type": String
  },
  "pastDueAmount": {
    "type": String
    optional: true
  },
  "highCredit": {
    "type": String
    optional: true
  },
  "creditLimit": {
    "type": String
    optional: true
  },
  "paymentAmount": {
    "type": String
  },
  "dateOpened": {
    "type": Date
    autoform:
      afFieldInput:
        type: "bootstrap-datepicker"
        datePickerOptions:
          autoclose: true
  },
  "dateReported": {
    "type": Date
    autoform:
      afFieldInput:
        type: "bootstrap-datepicker"
        datePickerOptions:
          autoclose: true
  },
  "dateOfLastActivity": {
    "type": Date
    autoform:
      afFieldInput:
        type: "bootstrap-datepicker"
        datePickerOptions:
          autoclose: true
  },
  "past7yrsLatePayments": {
    "type": String
    optional: true
    label: "Past 7yrs late payments"
  },
  "internalNotes": {
    "type": String
    optional: true
    autoform:
      afFieldInput:
        type: "textarea"
  }
)

@Schema.itemCollection= new SimpleSchema(
  "accountNumber": {
    "type": String
  },
  "status": {
    "type": String
    autoform:
      type: "select"
      options: ()->
        data = colAdminSystem.findOne({name: "dropDowns"}).collectionStatus
        data.map (c)->
          return {label: c, value: c}
  },
  "originalCreditor": {
    "type": String
  },
  "balanceAmount": {
    "type": String
  },
  "dateOpened": {
    "type": Date
    autoform:
      afFieldInput:
        type: "bootstrap-datepicker"
        datePickerOptions:
          autoclose: true
  },
  "dateReported": {
    "type": Date
    autoform:
      afFieldInput:
        type: "bootstrap-datepicker"
        datePickerOptions:
          autoclose: true
  },
  "dateOfLastActivity": {
    "type": Date
    autoform:
      afFieldInput:
        type: "bootstrap-datepicker"
        datePickerOptions:
          autoclose: true
  },
  "internalNotes": {
    "type": String
    optional: true
    autoform:
      afFieldInput:
        type: "textarea"
  }
)

@Schema.itemPublicRecord= new SimpleSchema(
  "status": {
    "type": String
    autoform:
      type: "select"
      options: ()->
        data = colAdminSystem.findOne({name: "dropDowns"}).publicRecordStatus
        data.map (c)->
          return {label: c, value: c}
  },
  "type": {
    "type": String
    autoform:
      type: "select"
      options: ()->
        data = colAdminSystem.findOne({name: "dropDowns"}).publicRecordTypes
        data.map (c)->
          return {label: c, value: c}
  },
  "dateReported": {
    "type": Date
    autoform:
      afFieldInput:
        type: "bootstrap-datepicker"
        datePickerOptions:
          autoclose: true
  },
  "dateReleased": {
    "type": Date
    autoform:
      afFieldInput:
        type: "bootstrap-datepicker"
        datePickerOptions:
          autoclose: true
  },
  "referenceNumber": {
    "type": String
  },
  "court": {
    "type": String
  },
  "amount": {
    "type": String
  },
  "plaintiff": {
    "type": String
  },
  "internalNotes": {
    "type": String
    optional: true
    autoform:
      afFieldInput:
        type: "textarea"
  }
)

@Schema.itemInquiry = new SimpleSchema(
  "inquiryDate": {
    "type": Date
    autoform:
      afFieldInput:
        type: "bootstrap-datepicker"
        datePickerOptions:
          autoclose: true
  },
  "internalNotes": {
    "type": String
    optional: true
    autoform:
      afFieldInput:
        type: "textarea"
  }
)


#colClientItems.attachSchema(@Schema.clientItem)



