if !@Schema
  @Schema = {}

@Schema.clientFile = new SimpleSchema(
  "clientID":
    type: String
  "authorID":
    type: String
  "file":
    type: String
  "itemID":
    type: String
    optional: true
  "createdAt":
    type: Date
    autoValue: ()->
      if this.isInsert
        return moment().toDate()
)

@Schema.clientNote = new SimpleSchema(
  "clientID":
    type: String
  "authorID":
    type: String
  "note":
    type: String
    autoform:
      afFieldInput:
        type: "textarea"
  "itemID":
    type: String
    optional: true
  "flag":
    type: Boolean
    label: "Flag this Note"
  "clientView":
    type: Boolean
    label: "Viewable by Client"
  "createdAt":
    type: Date
    autoValue: ()->
      if this.isInsert
        return moment().toDate()
)



colClientNotes.attachSchema(@Schema.clientNote)
colClientFiles.attachSchema(@Schema.clientFile)