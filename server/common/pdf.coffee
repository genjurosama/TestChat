@pdf = Meteor.npmRequire('html-pdf');

@pdfBuffer = (html, cb) ->
  pdf.create(html).toBuffer(Meteor.bindEnvironment((err, buffer) ->
    cb && cb(null, buffer);
    return buffer
  ))
  return

#SSR.compileTemplate('auditStep3', Assets.getText('auditLorem.html'));
#console.log SSR.render("auditStep3", {_id: "T8AXCy6xqa3wauh9W"})


Meteor.methods
  getPdf: (html)->
    check(html, String)
    html = Assets.getText("auditLorem.html")+html
    buffer = Meteor.wrapAsync(pdfBuffer);
    result=buffer(html)
    resultId = PdfCollection.insert({pdf:result});
    return resultId;
