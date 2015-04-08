Router.route "index"

Router.route 'signup',
  template: 'signUp'
Router.route 'login',
  template: 'loginSignup'
  layoutTemplate: 'landing'