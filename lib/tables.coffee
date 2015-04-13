@TabularTables = @TabularTables or {};

if Meteor.isClient
  Template.registerHelper('TabularTables', TabularTables)

_t = (template) ->
  Template[template] if Meteor.isClient

TabularTables.Users = new Tabular.Table
  name: 'Users'
  collection: Meteor.users
  pub: "users"
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