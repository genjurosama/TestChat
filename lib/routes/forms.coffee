Router.route "digitalSignMain"
Router.route 'builder',
  path: '/builder'
  template: 'builder'
  layoutTemplate: 'layout'
  onBeforeAction: ->
    Session.set 'currentRoute', 'builder'
    @next()
    return
Router.route 'upload',
  path: '/upload'
  template: 'uploadTemplate'
  layoutTemplate: 'layout'
  onBeforeAction: ->
    Session.set 'currentRoute', 'upload'
    @next()
    return

Router.route 'uploads',
  path: '/uploads'
  template: 'uploadsList'
  layoutTemplate: 'layout'
  onBeforeAction: ->
    Session.set 'currentRoute', 'uploads'
    @next()
    return
Router.route 'formsList',
  path: '/formsList'
  template: 'formsList'
  layoutTemplate: 'layout'
  onBeforeAction: ->
    Session.set 'currentRoute', 'formsList'
    @next()
    return
  Router.route 'templatesList',
    path: '/templatesList'
    template: 'templatesList'
    layoutTemplate: 'layout'
    onBeforeAction: ->
      Session.set 'currentRoute', 'templatesList'
      @next()
      return
Router.route 'signedformsList',
  path: '/signedformsList'
  template: 'signedformsList'
  layoutTemplate: 'layout'
  onBeforeAction: ->
    Session.set 'currentRoute', 'signedformsList'
    @next()
    return

Router.route '/form/:_id',
  name: 'forms'
  layoutTemplate: 'layout'
  action: ->
    @render 'viewForm', data: ->
      console.log 'id' + @params._id
      colForms.findOne _id: @params._id
    return

Router.route '/editform/:_id',
  name: 'forms.edit'
  layoutTemplate: 'layout'
  action: ->
    @render 'editbuilder', data: ->
      colForms.findOne _id: @params._id
    return



Router.route '/signedform/:_id',
  name: 'signedforms.show'
  layoutTemplate: 'layout'
  action: ->
    @render 'viewsignedForm', data: ->
      signedforms.findOne _id: @params._id
    return


Router.route '/sendform/:_id',
  name: 'forms.send'
  layoutTemplate: 'layout'
  action: ->
    @render 'sendform', data: ->
      forms.findOne _id: @params._id
    return



Router.route "client.forms.Creator",
  name: 'clientFormsCreator'