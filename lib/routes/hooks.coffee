###
* Hook: Check if a User is Logged In
* If a user is not logged in and attempts to go to an authenticated route,
* re-route them to the login screen.
###

checkUserLoggedIn = ->
  if !Meteor.loggingIn() and !Meteor.user()
    Router.go 'login'
  else
    @next()
  return

###
* Hook: Check if a User Exists
* If a user is logged in and attempts to go to a public route, re-route
* them to the index path.
###

userAuthenticated = ->
  if !Meteor.loggingIn() and Meteor.user()
    Router.go 'index'
  else
    @next()
  return


###
* Run Hooks
###

Router.onBeforeAction checkUserLoggedIn, except: [
  'signup'
  'login'
  'recover-password'
  'reset-password'
  'ref'
]
Router.onBeforeAction userAuthenticated, only: [
  'signup'
  'login'
  'recover-password'
  'reset-password'
  'ref'
]
