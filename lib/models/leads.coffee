if !@Schema
  @Schema = {}
@Schema.leads = new SimpleSchema(
  firstname:
    type: String
    regEx: /^[a-zA-Z-]{2,25}$/
    optional: true
  lastname:
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
  email:
    type:String
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

)


colLeads.attachSchema(@Schema.leads)

