// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require united/loader
//= require united/bootswatch
//= require_tree .
//= require jquery.flexslider
//= require jquery.flexslider-min
//= require bootstrap-datepicker
//= require jquery.rambling.slider
//= require easyzoom
//= require lightbox
//= require jquery.elevatezoom


$(window).load(function() {
  
    $(".zoom").elevateZoom({
      zoomWindowWidth:200,
      zoomWindowHeight:200,
      zoomWindowPosition:11
    });
  
    $('.flexslider').flexslider()({
      animation: 'fade',
      controlsContainer: '.flexslider',
      selector: '.slides > div',
      useCSS: false
    });
 
  });


 $(document).on("focus", "[data-behaviour~='datepicker']", function(e){
    $(this).datepicker({"format": "dd-mm-yyyy", "weekStart": 1, "autoclose": true})
})

