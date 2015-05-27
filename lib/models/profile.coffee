if !@Schema
  @Schema = {}
@Schema.UserProfile = new SimpleSchema(
  name:
    type: String
    label: 'Name'
    optional: true
  prefix:
    type: String
    label: 'Prefix'
    optional: true
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
  fax:
    type: String
    regEx: /^[a-zA-Z0-9 \-\(\)]{3,25}$/
    optional: true
  birthday:
    type: Date
    optional: true
    autoform:
      afFieldInput:
        type: "bootstrap-datepicker"
        datePickerOptions:
          autoclose: true
          viewMode: 'years'
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
    autoform:
      type: "select"
      options: ()->
        [
          {label: "Alabama", value: "Alabama"},
          {label: "Alaska", value: "Alaska"},
          {label: "Arizona", value: "Arizona"},
          {label: "Arkansas", value: "Arkansas"},
          {label: "California", value: "California"},
          {label: "Colorado", value: "Colorado"},
          {label: "Connecticut", value: "Connecticut"},
          {label: "Delaware", value: "Delaware"},
          {label: "Florida", value: "Florida"},
          {label: "Georgia", value: "Georgia"},
          {label: "Hawaii", value: "Hawaii"},
          {label: "Idaho", value: "Idaho"},
          {label: "Illinois", value: "Illinois"},
          {label: "Indiana", value: "Indiana"},
          {label: "Iowa", value: "Iowa"},
          {label: "Kansas", value: "Kansas"},
          {label: "Kentucky", value: "Kentucky"},
          {label: "Louisiana", value: "Louisiana"},
          {label: "Maine", value: "Maine"},
          {label: "Maryland", value: "Maryland"},
          {label: "Massachusetts", value: "Massachusetts"},
          {label: "Michigan", value: "Michigan"},
          {label: "Minnesota", value: "Minnesota"},
          {label: "Mississippi", value: "Mississippi"},
          {label: "Missouri", value: "Missouri"},
          {label: "Montana", value: "Montana"},
          {label: "Nebraska", value: "Nebraska"},
          {label: "Nevada", value: "Nevada"},
          {label: "New Hampshire", value: "New Hampshire"},
          {label: "New Jersey", value: "New Jersey"},
          {label: "New Mexico", value: "New Mexico"},
          {label: "New York", value: "New York"},
          {label: "North Carolina", value: "North Carolina"},
          {label: "North Dakota", value: "North Dakota"},
          {label: "Ohio", value: "Ohio"},
          {label: "Oklahoma", value: "Oklahoma"},
          {label: "Oregon", value: "Oregon"},
          {label: "Pennsylvania", value: "Pennsylvania"},
          {label: "Rhode Island", value: "Rhode Island"},
          {label: "South Carolina", value: "South Carolina"},
          {label: "South Dakota", value: "South Dakota"},
          {label: "Tennessee", value: "Tennessee"},
          {label: "Texas", value: "Texas"},
          {label: "Utah", value: "Utah"},
          {label: "Vermont", value: "Vermont"},
          {label: "Virginia", value: "Virginia"},
          {label: "Washington", value: "Washington"},
          {label: "West Virginia", value: "West Virginia"},
          {label: "Wisconsin", value: "Wisconsin"},
          {label: "Wyoming", value: "Wyoming"},
          {label: "District of Columbia", value: "District of Columbia"},
          {label: "Puerto Rico", value: "Puerto Rico"},
          {label: "Guam", value: "Guam"},
          {label: "American Samoa", value: "American Samoa"},
          {label: "U.S. Virgin Islands", value: "U.S. Virgin Islands"},
          {label: "Northern Mariana Islands", value: "Northern Mariana Islands"},
        ]
  zip:
    type: String
    optional: true
  signature:
    type: String
    optional: true
  billingStatus:
    type: String
    optional: true
  monitoringSite:
    type: String
    optional: true
    autoform:
      type: "select"
      options: ()->
        data = colAdminSystem.findOne({name: "dropDowns"}).sources
        data.map (c)->
          return {label: c.reportSource, value: c.reportSource}

  monitoringUsername:
    type: String
    optional: true
  monitoringPassword:
    type: String
    optional: true
  securityWord:
    type: String
    optional: true
  SSN:
    type: String
    label: 'SSN'
    optional: true
  paymentArrangement:
    type: String
    optional: true
    autoform:
      afFieldInput:
        type: "textarea"
  status:
    type: String
    optional: true
    allowedValues: [
      "Active",
      "Inactive",
      "Pending",
      "Results Overdue",
      "Past Due",
      "Canceled"
    ]
    autoform:
      type: "select"
      options: ()->
        [
          {label: "Active", value: "Active"},
          {label: "Inactive", value: "Inactive"},
          {label: "Pending", value: "Pending"},
          {label: "Results Overdue", value: "Results Overdue"},
          {label: "Past Due", value: "Past Due"},
          {label: "Canceled", value: "Canceled"}
        ]
  leadQuality:
    type: String
    optional: true
    allowedValues: [
      "Hot",
      "Warm",
      "Cold"
    ]
    autoform:
      type: "select"
      options: ()->
        [
          {label: "Hot", value: "Hot"},
          {label: "Warm", value: "Warm"},
          {label: "Cold", value: "Cold"}
        ]
  jointCustomer:
    type: String
    optional: true
    autoform:
      type: "select"
      options: ()->
        data = Meteor.users.find({roles: {$in:['lead', 'client']}})
        data.map (c)->
          return {label: c.profile.firstname+" "+c.profile.lastname, value: c._id}
  assignedTo:
    type: String
    optional: true
    autoform:
      type: "select"
      options: ()->
        data = Meteor.users.find({roles: {$nin:['lead', 'client']}})
        data.map (c)->
          return {label: c.profile.firstname+" "+c.profile.lastname, value: c._id}
  salesRep:
    type: String
    optional: true
    autoform:
      type: "select"
      options: ()->
        data = Meteor.users.find({roles: {$in:['salesRep']}})
        data.map (c)->
          return {label: c.profile.firstname+" "+c.profile.lastname, value: c._id}
  affiliate:
    type: String
    optional: true
    autoform:
      type: "select"
      options: ()->
        data = Meteor.users.find({roles: {$in:['user']}})
        data.map (c)->
          return {label: c.profile.firstname+" "+c.profile.lastname, value: c._id}
  parentAffiliate:
    type: String
    optional: true
    autoform:
      type: "select"
      options: ()->
        data = Meteor.users.find({roles: {$in:['user']}})
        data.map (c)->
          return {label: c.profile.firstname+" "+c.profile.lastname, value: c._id}
  source:
    type: String
    optional: true
  emailOptOut:
    type: Boolean
    label: 'Emails opt out'
    optional: true
  phoneOptOut:
    type: Boolean
    label: 'Phone Calls opt out'
    optional: true
  textOptOut:
    type: Boolean
    label: 'Text Messages opt out'
    optional: true
  portalAccess:
    type: Boolean
    label: 'Portal Access'
    optional: true
  interviewer:
    type: Boolean
    optional: true
  language:
    type: String
    optional: true
    allowedValues: ['US English', 'Spanish']
    autoform:
      options: ()->
        [
          {label: "US English", value: "US English"},
          {label: "Spanish", value: "Spanish"}
        ]
  customerPrivacy:
    type: String
    optional: true
    allowedValues: ['Affiliate Access', 'Private']
    autoform:
      options: ()->
        [
          {label: "Affiliate Access", value: "Affiliate Access"},
          {label: "Private", value: "Private"}
        ]
  profilesToDisplay:
    type: [String]
    allowedValues: ['Credit Coordinator', 'Sales Representative', 'Referral Partner']
    optional: true
    autoform:
      options: ()->
        [
          {label: "Credit Coordinator", value: "Credit Coordinator"},
          {label: "Sales Representative", value: "Sales Representative"},
          {label: "Referral Partner", value: "Referral Partner"}
        ]
  enrollDate:
    type: Date
    optional: true
    autoform:
      afFieldInput:
        type: "bootstrap-datepicker"
        datePickerOptions:
          autoclose: true
  cancelDate:
    type: Date
    optional: true
    autoform:
      afFieldInput:
        type: "bootstrap-datepicker"
        datePickerOptions:
          autoclose: true
  emailSettings:
    type: Object
  'emailSettings.sendGrid':
    type: Object
  'emailSettings.default':
    type: String
    label: "Set as default"
  'emailSettings.sendGrid.username':
    type: String
  'emailSettings.sendGrid.password':
    type: String
  'emailSettings.mandril':
    type: Object
  'emailSettings.mandril.username':
    type: String
  'emailSettings.mandril.apikey':
    type: String
  'emailSettings.amazonSES':
    type: Object
  'emailSettings.amazonSES.username':
    type: String
  'emailSettings.amazonSES.password':
    type: String
  'emailSettings.amazonSES.host':
    type: String

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
    label: "Email"
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
    type: Array,
    optional: true,
    blackbox: true
  "roles.$":
    type: String,
    optional: true,
    blackbox: true
  )


Meteor.users.attachSchema(@Schema.User)

