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
        {label: "Collection Agency", value: "Collection Agency"},
        {label: "Original Creditor", value: "Original Creditor"},
        {label: "Government Office", value: "Government Office"}
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
    type:String
    label:"Email Content"
    autoform:
      afFieldInput:
        type: "summernote"
        class: 'editor'
  "createdAt":
    type: Date
    autoValue: ()->
      if this.isInsert
        return moment().toDate()
)
colEmailTemplates.attachSchema(@Schema.emailTemplate)
colMyEmailTemplates.attachSchema(@Schema.emailTemplate)