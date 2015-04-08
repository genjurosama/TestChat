if !@Schema
  @Schema = {}
@Schema.UserProfile = new SimpleSchema(
  name:
    type: String
    label: 'Name'
  firstname:
    type: String
    regEx: /^[a-zA-Z-]{2,25}$/
    optional: true
  lastname:
    type: String
    regEx: /^[a-zA-Z]{2,25}$/
    optional: true
  middlename:
    type: String
    regEx: /^[a-zA-Z]{2,25}$/
    optional: true
  phone:
    type: String
    regEx: /^[a-zA-Z0-9 \-\(\)]{3,25}$/
    optional: true
  phone2:
    type: String
    regEx: /^[a-zA-Z0-9 \-\(\)]{3,25}$/
    optional: true
  birthday:
    type: String
    optional: true
  createdAt:
    type: Date
    optional: true
  address:
    type: String
    optional: true
  address2:
    type: String
    optional: true
  city:
    type: String
    optional: true
  state:
    type: String
    optional: true
  zip:
    type: String
    optional: true
  signature:
    type: String
    optional: true
)
@Schema.User = new SimpleSchema(
  emails:
    type: [Object]
    optional: false
    blackbox: true
  "emails.$.address":
      optional: false
      type: String
      regEx: SimpleSchema.RegEx.Email
  createdAt:
    type: Date
    autoValue: ->
      if @isInsert
        return new Date
      else if @isUpsert
        return { $setOnInsert: new Date }
      else
        @unset()
      return
  profile: type: Schema.UserProfile
  services:
    type: Object
    optional: true
    blackbox: true
  roles:
    type: String,
    optional: true,
    blackbox: true,
    allowedValues: ['admin', 'user']
  )


Meteor.users.attachSchema(@Schema.User)

