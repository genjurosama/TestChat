Meteor.Email = function(){
  // send email function
  var send = function(options){
    getEmailSettings();
    if (Meteor.user()){
      Email.send({
        to: options.to,
        from: options.from,
        subject: options.subject,
        html: options.content
      })

    }
  };

  // Get default Email and set to email config
  var getEmailSettings = function(){
    if (Meteor.user()){
      var defaultSettings = Meteor.user().profile.emailSettings["default"];

      switch (defaultSettings) {
        case 'mandril':
          Meteor.Mandrill.config({
            username: Meteor.user().profile.emailSettings.mandril.username,
            key: Meteor.user().profile.emailSettings.mandril.apikey
          });
          break;
        case 'sendGrid':
          Meteor.Sendgrid.config({
            username: Meteor.user().profile.emailSettings.sendGrid.username,
            password: Meteor.user().profile.emailSettings.sendGrid.password
          });
          break;
        case 'amazonSES':
          Meteor.AmazonSES.config({
            username: Meteor.user().profile.emailSettings.amazonSES.username,
            password: Meteor.user().profile.emailSettings.amazonSES.password,
            host: Meteor.user().profile.emailSettings.amazonSES.host
          });
          break;
        default:
          throw new Meteor.Error(400, "You haven't set the email service default");
      }
    }

  };

  return {
    send: function(options){
      send(options);
    }

  }

}();




