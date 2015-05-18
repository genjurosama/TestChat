###
@pdf = Npm.require('html-pdf');

@pdfBuffer = (html, cb) ->
  pdf.create(html).toBuffer(Meteor.bindEnvironment((err, buffer) ->
    cb && cb(null, buffer);
    return buffer
  ))
  return

Meteor.methods
  getPdf: (html)->
    check(html, String)
    buffer = Meteor.wrapAsync(pdfBuffer);
    result=buffer(html)
    resultId = PdfCollection.insert({pdf:result});
    return resultId;
    #return buffer(html)###

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


