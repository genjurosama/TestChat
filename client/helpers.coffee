Template.registerHelper "activeRoute", ->
  currentRoute = Router.current().route?.getName()
  return "" unless currentRoute
  isRoute = currentRoute == @?.path
  isPrefix = @.prefix and (currentRoute.startsWith @.prefix)
  return "active" if isRoute or isPrefix

Template.registerHelper "userName", (id)->
  if !id
    id = Meteor.userId()
  usr = Meteor.users.findOne _id: id
  if usr
    return usr.profile.lastname+" "+usr.profile.firstname