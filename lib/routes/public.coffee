Router.route "index",
  path: "/"

Router.route 'signup',
  template: 'signUp'
Router.route 'login',
  template: 'loginSignup'
  layoutTemplate: 'landing'