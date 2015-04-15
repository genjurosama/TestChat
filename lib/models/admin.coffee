if !@Schema
  @Schema = {}

@Schema.auditTree = new SimpleSchema(
  "item_id":
    type: String
    autoValue: ()->
      if this.isInsert
        return moment().format("x")
  "title":
    type: String
  "description":
    type: String
    optional: true
    autoform:
      afFieldInput:
        type: "textarea"
)

@Schema.furnishers = new SimpleSchema(
  "name":
    type: String
  "address":
    type: String
  "city":
    type: String
  "state":
    type: String
  "zip":
    type: String

)

@Schema.adminSystem = new SimpleSchema(
  data:
    type: Array
    optional: true
    blackbox: true
  "data.$":
    type: Object
    blackbox: true
  accountTypes:
    type: Array
    optional: true
  "accountTypes.$":
    type: String

  accountResponsibility:
    type: Array
    optional: true
  "accountResponsibility.$":
    type: String

  accountStatus:
    type: Array
    optional: true
  "accountStatus.$":
    type: String

  collectionStatus:
    type: Array
    optional: true
  "collectionStatus.$":
    type: String

  publicRecordTypes:
    type: Array
    optional: true
  "publicRecordTypes.$":
    type: String

  publicRecordStatus:
    type: Array
    optional: true
  "publicRecordStatus.$":
    type: String

  snipets:
    type: Array
    optional: true
  "snipets.$":
    type: Object
  "snipets.$.title":
    type: String
  "snipets.$.snipet":
    type: String
    autoform:
      afFieldInput:
        type: "textarea"

  emails:
    type: Object
    optional: true
  "emails.administrator":
    type: String
  "emails.processor":
    type: String
  "emails.sales":
    type: String
  "emails.customerService":
    type: String
  "emails.affiliate":
    type: String


  sources:
    type: Array
    optional: true
  "sources.$":
    type: Object
  "sources.$.reportSource":
    type: String
  "sources.$.scoreModel":
    type: String
  "sources.$.loginURL":
    type: String




  instructions:
    type: Array
    optional: true
  "instructions.$":
    type: Object
  "instructions.$.name":
    type: String
    label: "Instruction"
  "instructions.$.accounts":
    label: "Accounts"
    type: Boolean
  "instructions.$.collections":
    label: "Collections"
    type: Boolean
  "instructions.$.public_records":
    label: "Public Records"
    type: Boolean
  "instructions.$.inquiries":
    label: "Inquiries"
    type: Boolean
  "instructions.$.incorrect_name":
    label: "Incor Name"
    type: Boolean
  "instructions.$.incorrect_ssn":
    label: "Incor SSN"
    type: Boolean
  "instructions.$.incorrect_dob":
    label: "Incor DOB"
    type: Boolean
  "instructions.$.incorrect_address":
    label: "Incor Address"
    type: Boolean


)



colAdminSystem.attachSchema(@Schema.adminSystem)
colFurhishers.attachSchema(@Schema.furnishers)
colAuditItems.attachSchema(@Schema.auditTree)
