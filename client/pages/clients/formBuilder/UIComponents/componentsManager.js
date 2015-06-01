Template.signature.events({
  "click button": function(e,tpl){
    console.log("clear");
    pad=tpl.find("canvas");
    signature = new SignaturePad(pad);
    signature.clear();

  }
})
Template.photo.events({
  "click .capture": function(e,tpl){
    elem =  tpl.find(".photo");
    var cameraOptions = {
      width: 800,
      height: 600
    };
    MeteorCamera.getPicture(cameraOptions, function (error, data) {
      if (!error) {
        console.log(data);
        $(elem).attr("src", data);
      }
    });
  }
})


Template.radio.rendered= function(){

  $('.icheck').iCheck({
    checkboxClass: 'icheckbox_flat-grey',
    radioClass: 'iradio_flat-grey',
    increaseArea: '20%' // optional
  });

  }

