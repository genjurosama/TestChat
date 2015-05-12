Meteor.methods
  userDelete: (id)->
    Meteor.users.remove({_id: id})
  userUpdate: (user, id)->
    Meteor.users.update({_id: id}, user)
  registerUser: (user, profile)->
    console.log "# register user", JSON.stringify user, profile
    check user, Object
    if !profile
      profile = {}
    if user.name
      profile.firstname = user.name
      profile.lastname = ''
      profile.name = user.name


    if user.password
      uid = Accounts.createUser
        email: user.email
        password: user.password
        profile: _.defaults(user?.profile or {}, profile)
    else
      user.profile = _.defaults(user?.profile or {}, profile)
      uid = Accounts.createUser user
    console.log "[#{uid}] user created"

    Meteor.setTimeout ->
      if user.email
        if user.password
          console.log "[#{uid}] sendVerificationEmail"
          Accounts.sendVerificationEmail(uid, user.email)
        else
          console.log "[#{uid}] sendEnrollmentEmail"
          Accounts.sendEnrollmentEmail uid
        maybeAddAdminPermitions(uid, user.email)
    , 10
    return uid

  emailTemplateDelete: (id)->
    colEmailTemplates.remove({_id: id})
  emailTemplateUpdate: (email, id)->
    colEmailTemplates.update({_id: id}, email)
  addNewEmailTemplate: (email)->
    console.log "# adding email", JSON.stringify email
    check email, Object
    colEmailTemplates.insert(email)
  myEmailTemplateDelete: (id)->
    colMyEmailTemplates.remove({_id: id})
  myEmailTemplateUpdate: (email, id)->
    colMyEmailTemplates.update({_id: id}, email)
  addNewMyEmailTemplate: (email)->
    console.log "# adding email", JSON.stringify email
    email.uid = Meteor.UserId
    console.log "display id",Meteor.UserId
    check email, Object
    colMyEmailTemplates.insert(email)
  leadDelete: (id)->
    colLeads.remove({_id: id})
  leadUpdate: (email, id)->
    colLeads.update({_id: id}, email)
  addNewLead: (lead)->
    console.log "# adding lead", JSON.stringify lead
    check lead, Object
    colLeads.insert(lead)

maybeAddAdminPermitions = (uid, email) ->
  admins_list = _ [
    "benbressington@gmail.com"
    "pokutnik@gmail.com"
    "alex.chenosov@gmail.com"
  ]
  if admins_list.contains email
    Roles.addUsersToRoles(uid, 'admin')
    console.log "[#{uid}] added admin permission"
