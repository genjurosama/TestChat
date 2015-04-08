REF_ID_KEY = 'REF_ID'

@RefSet = (ref) ->
  oldref = Meteor._localStorage.getItem(REF_ID_KEY)
  Meteor._localStorage.setItem(REF_ID_KEY, ref) unless oldref

@RefGet = ->
  Meteor._localStorage.getItem(REF_ID_KEY)
