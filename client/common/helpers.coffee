String::startsWith ?= (s) -> @[...s.length] is s

UI.registerHelper 'equals', (a, b) ->
  a == b

Template.registerHelper "activeRoute", ->
  currentRoute = Router.current().route?.getName()
  return "" unless currentRoute
  isRoute = currentRoute == @?.path
  isPrefix = @.prefix and (currentRoute.startsWith @.prefix)
  return "active" if isRoute or isPrefix



Template.registerHelper 'linebreaksbr', (input) ->
  nl2br = (input + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1' + '<br>' + '$2');
  return new Spacebars.SafeString(nl2br);

Template.registerHelper 'formatDateTime', (rawDate, formatString) ->
  if !_.isDate(rawDate)
    return ''
  if _.isString(formatString)
    moment(rawDate).format formatString
  else
    moment(rawDate).format()

Template.registerHelper 'truncateChars', (input, length) ->
  if !_.isString(input)
    return ''
  if !_.isFinite(length)
    return input
  input.substring 0, length

Template.registerHelper 'getField', (field, collection, id) ->
  return window[collection].findOne({_id:id})[field]

Template.registerHelper 'isUserInRole', (role) ->
  return isUserInRole Meteor.userId(), role

Template.registerHelper 'conditionHelper', (bVar, ifTrue, ifFalse) ->
  if bVar
    return ifTrue
  else
    return ifFalse

#NON-template
@widgetToggle = ->
  $('.actions > .fa-chevron-up').click ->
    $(this).parent().parent().parent().next().slideToggle('fast')
    $(this).toggleClass('fa-chevron-down fa-chevron-up')
    return
  return
