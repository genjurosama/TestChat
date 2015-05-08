@Schema.clientItem = new SimpleSchema(
  "clientID":
    type: String
  "authorID":
    type: String
  "name":
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
    type: String
  "instructions":
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
    type: [Schema.itemIncorrectName]
  "itemData.incorrectAddress":
    optional: true
    type: [Schema.itemIncorrectAddress]
  "itemData.account":
    optional: true
    type: [Schema.itemAccount]
  "itemData.collection":
    optional: true
    type: [Schema.itemCollection]
)

@Schema.itemIncorrectName = new SimpleSchema(
  "incorrectName": {
    "type": "String"
  }
)

@Schema.itemIncorrectAddress = new SimpleSchema(
  "address": {
    "type": "String"
  },
  "city": {
    "type": "String"
  },
  "state": {
    "type": "String"
  },
  "zip": {
    "type": "String"
  }
)

@Schema.itemAccount = new SimpleSchema(
  "accountNumber": {
    "type": "String"
  },
  "balanceAmount": {
    "type": "String"
  },
  "status": {
    "type": "String"
  },
  "type": {
    "type": "String"
  },
  "responsibility": {
    "type": "String"
  },
  "pastDueAmount": {
    "type": "String"
  },
  "highCredit": {
    "type": "String"
  },
  "creditLimit": {
    "type": "String"
  },
  "paymentAmount": {
    "type": "String"
  },
  "dateOpened": {
    "type": "String"
  },
  "dateReported": {
    "type": "String"
  },
  "dateofLastActivity": {
    "type": "String"
  },
  "past7yrsLatePayments": {
    "type": "String"
  },
  "internalNotes": {
    "type": "String"
  }
)

@Schema.itemCollection= new SimpleSchema(
  "accountNumber": {
    "type": "String"
  },
  "status": {
    "type": "String"
  },
  "originalCreditor": {
    "type": "String"
  },
  "balanceAmount": {
    "type": "String"
  },
  "dateOpened": {
    "type": "String"
  },
  "dateReported": {
    "type": "String"
  },
  "dateofLastActivity": {
    "type": "String"
  },
  "internalNotes": {
    "type": "String"
  }
)


colClientItems.attachSchema(@Schema.clientItem)



