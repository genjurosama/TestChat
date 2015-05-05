@Schema.emailTemplate = new SimpleSchema(
  "emailID":
    type: String
  "category":
    type: String
  "description":
    type: String
    autoform:
      afFieldInput:
        type: "textarea"
  "content":
    type:String
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