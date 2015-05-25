

###
i=0
while i<441
  i++
  res = Meteor.http.get("http://dev.disputecomposer.com/pages/audit_tree_modal.php?action=edit&tree_id="+i)
  html = res.content

  reg = /textarea(.*?)>(.*?)<\/textarea/
  res = reg.exec(html)
  if res && res[2]
    colAuditItems.update({item_id: i+""}, {$set:{description: res[2]}})
    console.log i###


