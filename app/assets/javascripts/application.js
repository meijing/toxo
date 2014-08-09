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

$(window).load(function() {
    $('.flexslider').flexslider()({
    animation: "slide",
    controlsContainer: '.flexslider',
    selector: '.slides > div',
    useCSS: false
  });
  });

 $(document).on("focus", "[data-behaviour~='datepicker']", function(e){
    $(this).datepicker({"format": "dd-mm-yyyy", "weekStart": 1, "autoclose": true})
})
// Instantiate EasyZoom plugin
var $easyzoom = $('.easyzoom').easyZoom();

// Get the instance API
var api = $easyzoom.data('easyZoom');

$(function(){
    $('.zoom img').each(function() {
        var original_img_url = $(this).attr('data-zoom-url');
        $(this)
        .parent()
        .zoom({url: original_img_url});
    });
});