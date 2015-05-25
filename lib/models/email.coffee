@Schema.emailTemplate = new SimpleSchema(
  "uid":
    type:String
    optional:true
  "name":
    type: String
  "category":
    type: String
    allowedValues: ['Bureau', 'Collection Agency', 'Original Creditor','Government Office']
    autoform: {
      options: [
        {label: "Bureau", value: "Bureau"},
        {label: "Collection Agenvar atts = _.clone(this.atts);cy", value: "Collection Agency"},
        {label: "Original Creditor", value: "Original Creditor"},
        {label: "Government Office", value: "Government Office"}
      ]
    }
  "Templatetype":
    type: String
    label: "type"
    allowedValues: ['Fax', 'Letter', 'Email','Text Message']
    autoform: {
      options: [
        {label: "Fax", value: "Fax"},
        {label: "Letter", value: "Letter"},
        {label: "Email", value: "Email"},
        {label: "Text Message", value: "Text Message"}
      ]
    }
  "description":
    type: String
    autoform:
      afFieldInput:
        type: "textarea"
  "subject":
    type :String
    label:"Email Subject"
  "type":
    type:String
    optional:true
  "content":
    type: String
    label: "Froala Email"
    autoform: {
      type: "froalaEmail"
      afFieldInput: {
        froalaOptions: froalaOptions
      }
    }
  "createdAt":
    type: Date
    autoValue: ()->
      if this.isInsert
        return moment().toDate()
)
colEmailTemplates.attachSchema(@Schema.emailTemplate)
colMyEmailTemplates.attachSchema(@Schema.emailTemplate)