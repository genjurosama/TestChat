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
  "order":
	  type: String
  "incorrectName":
	  type: String
  "disputeInstructions":
	  type: String
  "interviewer":
	  type: String
  "action":
	  type: String
  "status":
	  type: String
  "history":
	  type: String
  "reported":
	  type: String
  "address":
	  type: String
  "city":
	  type: String
  "state":
	  type: String
  "zipCode":
	  type: String
  "accountNumber":
	  type: String
  "balanceAmount":
	  type: String
  "responsibility":
	  type: String
  "pastDueAmount":
	  type: String
  "highCredit":
	  type: String
  "creditLimit":
	  type: String
  "paymentAmount":
	  type: String
  "dateOpened":
	  type: String
  "dateReported":
	  type: String
  "dateofLastActivity":
	  type: String
  "past7yrsLatePayments":
	  type: String
  "internalNotes":
	  type: String
  "sOLClock":
	  type: String
  "originalCreditor":
	  type: String
)

colClientItems.attachSchema(@Schema.clientItem)



