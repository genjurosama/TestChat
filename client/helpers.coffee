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
    if !usr.profile.lastname
      usr.profile.lastname=''
    return usr.profile.lastname+" "+usr.profile.firstname

Template.registerHelper "creditBureaus", ()->
  return $.map creditBureaus, (value, index) ->
    value.key =  index
    [ value ]

Template.registerHelper "itemStatuses", ()->
  return $.map itemStatuses, (value, index) ->
    value.key =  index
    [ value ]

Template.registerHelper "getStatusTitle", (status)->
  if !status
    return "Negative"
  return itemStatuses[status].title

Template.registerHelper "statusIsPositive", (status)->
  if !status || status=="negative"
    return false
  else return true


Template.registerHelper 'concat', ()->
  return Array.prototype.slice.call(arguments, 0, -1).join('');

Template.registerHelper 'field2label', (fieldName)->
  return field2label(fieldName)

@field2label = (fieldName)->
  label = fieldName
  lastPeriod = label.lastIndexOf(".")
  if lastPeriod != -1
    label = label.substring(lastPeriod + 1)
    if label == "$"
      pcs = fieldName.split(".")
      label = pcs[pcs.length - 2]
  if label == "_id"
    return "ID"
  return S(label).humanize().s

