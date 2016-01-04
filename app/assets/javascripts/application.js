// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.ui.widget
//= require jquery.iframe-transport
//= require jquery.fileupload
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require_tree .


$(function () { 
    $(window).scroll(function () {
        if ($(this).scrollTop() > 600) $('a#move_up').fadeIn(); 
        else                           $('a#move_up').fadeOut(400); 
    });
    $('a#move_up').click(function () {
        $('body,html').animate({ 
            scrollTop: 0 
        }, 800); 
        return false;
    });
}); 