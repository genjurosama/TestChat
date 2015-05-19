@TabularTables = @TabularTables or {};

if Meteor.isClient
  Template.registerHelper('TabularTables', TabularTables)

_t = (template) ->
  Template[template] if Meteor.isClient

TabularTables.Clients = new Tabular.Table
  name: 'Clients'
  collection: Meteor.users
  selector: (uid) ->
    roles: {"$in":['client']}
  order: [[3, 'asc']]
  columns: [
    {
      className:      'details-control',
      orderable:      false,
      data:           null,
      defaultContent: "<span class='label label-success cursor-pointer'><i class='fa fa-plus'></span>"
    }
    {
      data: 'profile.firstname'
      title: 'First Name'
      width: '20%'
    }
    {
      data: 'profile.lastname'
      title: 'Last Name'
      width: '20%'
    }
    {
      data: 'emails'
      title: 'Email'
      width: '25%'
      render: (val, type, doc) ->
        ret = ""
        $.each val, (key, value) ->
          ret += value.address+"<br>"
          return
        return ret
    }
    {
      data: 'profile.phone'
      title: 'Phone'
      width: '20%'
    }
    {
      data: 'profile.status'
      title: 'Status'
      width: '10%'
    }
    {
      data: 'profile.zip'
      title: 'ZIP'
      width: '10%'
    }
    {
      title: 'Actions'
      width: '10%'
      tmpl:_t 'cellClientsActions'
    }
  ]
  extraFields: ['profile', 'roles']

TabularTables.Users = new Tabular.Table
  name: 'Users'
  collection: Meteor.users
  pub: "users"
  selector: (uid) ->
    roles: {"$nin":['client','lead']}
  order: [[3, 'asc']]
  columns: [
    {
      className:      'details-control',
      orderable:      false,
      data:           null,
      defaultContent: "<span class='label label-success cursor-pointer'><i class='fa fa-plus'></span>"
    }
    {
      data: 'profile.name'
      title: 'Name'
      width: '35%'
    }
    {
      data: 'emails'
      title: 'Email'
      width: '25%'
      render: (val, type, doc) ->
        ret = ""
        $.each val, (key, value) ->
          ret += value.address+"<br>"
          return
        return ret
    }
    {
      data: 'createdAt'
      title: 'Created At'
      width: '15%'
      render: (val, type, doc) ->
        if val instanceof Date
          moment(val).format('DD/MM/YYYY')
        else
          'Never'
    }
    {
      data: 'roles'
      title: 'Roles'
      width: '15%'
      tmpl:_t 'cellRoles'
    }
    {
      title: 'Actions'
      width: '10%'
      tmpl:_t 'cellUsersActions'
    }
  ]
  extraFields: ['profile', 'roles']

TabularTables.Furnishers = new Tabular.Table
  name: 'Furnishers'
  collection: colFurhishers
  columns: [
    {
      data: 'name'
      title: 'Name'
      width: '35%'
    }
    {
      data: 'address'
      title: 'Address'
      width: '25%'
    }
    {
      data: 'city'
      title: 'City'
      width: '15%'
    }
    {
      data: 'state'
      title: 'State'
      width: '15%'
    }
    {
      data: 'zip'
      title: 'Zip'
      width: '10%'
    }
    {
      title: 'Actions'
      width: '10%'
      tmpl:_t 'cellFurnishersActions'
    }
  ]

TabularTables.clientNotes = new Tabular.Table
  name: 'clientNotes'
  collection: colClientNotes
  order: [[3, 'desc']]
  columns: [
    {
      data: 'note'
      title: 'Note Description'
      width: '60%'
      render: (val, type, doc) ->
        return if doc.flag then "<h4 class='text-danger'>"+val+"</h4>" else val
    }
    {
      data: 'clientView'
      title: 'Viewable by Client'
      width: '10%'
      render: (val, type, doc) ->
        return if val then 'Yes' else 'No'
    }
    {
      data: 'authorID'
      title: 'Author'
      width: '15%'
      render: (val, type, doc) ->
        usr = Meteor.users.findOne _id:val
        return usr.profile.lastname+" "+usr.profile.firstname
    }
    {
      data: 'createdAt'
      title: 'Date/Time Added'
      width: '15%'
      render: (val, type, doc) ->
        return moment(val).format("LLLL")
    }
  ]
  extraFields: ['flag']


TabularTables.emailTemplates = new Tabular.Table
  name: 'emailTemplates'
  collection: colEmailTemplates
  order: [[3, 'desc']]
  columns: [
    {
      data: 'name'
      title: 'Template name'
      width: '25%'

    }
    {
      data: 'description'
      title: 'Template Description'
      width: '10%'

    }
    {
      data: 'category'
      title: 'Category'
      width: '15%'

    }
    {
      title: 'Actions'
      width: '10%'
      tmpl:_t 'cellEmailTemplatesActions'
    }
    {
      title : "content"
      data:"content"
      visible: false
    }
  ]
  extraFields: ['flag']


TabularTables.leads = new Tabular.Table
  name: 'leads'
  collection: Meteor.users
  pub: "users"
  selector: (uid) ->
    roles: {"$in":['lead']}
  order: [[3, 'asc']]
  order: [[3, 'desc']]
  columns: [
    {
      className:      'details-control',
      orderable:      false,
      data:           null,
      defaultContent: "<span class='label label-success cursor-pointer'><i class='fa fa-plus'></span>"
    }
    {
      data: 'profile.leadQuality'
      title: 'Lead'
      width: '5%'
    }
    {
      data: 'profile.status'
      title: 'Status'
      width: '15%'
    }
    {
      data: 'profile.firstname'
      title: 'First Name'
      width: '15%'

    }
    {
      data: 'profile.lastname'
      title: 'Last Name '
      width: '15%'

    }
    {
      data: 'profile.phone'
      title: 'Phone'
      width: '20%'

    }
    {
      data: 'emails.0.address'
      title: 'email'
      width: '20%'
    }
    {
      title: 'Actions'
      width: '10%'
      tmpl:_t 'cellLeadsActions'
    }
  ]
  extraFields: ['flag']

TabularTables.clientItems = new Tabular.Table
  name: 'clientItems'
  collection: colClientItems
  columns: [
    {
      className:      'details-control',
      orderable:      false,
      data:           null,
      defaultContent: "<span class='label label-success cursor-pointer'><i class='fa fa-plus'></span>"
    }
    {
      data: 'itemName'
      title: 'Title'
      width: '35%'
      tmpl:_t 'itemTitle'
    }
    {
      data: 'itemName'
      title: 'Status'
      width: '55%'
      tmpl:_t 'itemStatus'
    }
    {
      data: 'itemName'
      title: 'Actions'
      width: '10%'
      tmpl:_t 'itemActions'
    }
  ]
  extraFields: ['_id', 'clientID', 'itemName','itemType','authorID','furnisher', 'itemData']

TabularTables.clientAudit = new Tabular.Table
  name: 'clientAudit'
  collection: colClientAudit
  columns: [
    {
      data: 'createdAt'
      title: 'Audit Date'
      width: '35%'
      render: (val, type, doc) ->
        return moment(val).format("LLLL")
    }
    {
      data: 'authorID'
      title: 'Auditor'
      width: '35%'
      render: (val, type, doc) ->
        usr = Meteor.users.findOne _id:val
        return usr.profile.lastname+" "+usr.profile.firstname
    }
    {
      data: 'itemName'
      title: 'Actions'
      width: '10%'
      tmpl:_t 'itemActions'
    }
  ]
  extraFields: ['_id', 'clientID', 'itemName','itemType','authorID','furnisher', 'itemData']

