Meteor.startup(function(){
    var toggleSettings = function() {
        $('.config-link').click(function() {
            if ($(this).hasClass('open')) {
                $('#config').animate({
                    "right": "-205px"
                }, 150);
                $(this).removeClass('open').addClass('closed');
            } else {
                $("#config").animate({
                    "right": "0px"
                }, 150);
                $(this).removeClass('closed').addClass('open');
            }
        });
    };

    var navToggleLeft = function() {
    };

    toggleSettings();
    navToggleLeft();
});
