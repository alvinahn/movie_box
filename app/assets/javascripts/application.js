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
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function(){
  $('.movie-slider').slick({
    centerHeight: '100px',
    centerPadding: '20px',
    arrows: true,
    infinite: true,
    slidesToShow: 6,
    slidesToScroll: 3,
    speed: 400,
    responsive: [
    {
      breakpoint: 1200,
      settings: {
        arrows: false,
        centerMode: true,
        centerPadding: '40px',
        slidesToShow: 5
      }
    },
    {
      breakpoint: 1000,
      settings: {
        arrows: false,
        centerMode: true,
        centerPadding: '40px',
        slidesToShow: 3 
      }
    }
  ]
  });

  $('.movie-slider-auto').slick({
    centerHeight: '100px',
    centerPadding: '20px',
    arrows: true,
    infinite: true,
    slidesToShow: 6,
    slidesToScroll: 3,
    speed: 400,
    autoplay: true,
    autoplaySpeed: 2000,
    responsive: [
    {
      breakpoint: 1200,
      settings: {
        arrows: false,
        centerMode: true,
        centerPadding: '40px',
        slidesToShow: 5
      }
    },
    {
      breakpoint: 1000,
      settings: {
        arrows: false,
        centerMode: true,
        centerPadding: '40px',
        slidesToShow: 3 
      }
    }
  ]
  });

  $('.navbar-brand').on('click', function(){
    window.location.href = "/movies";
  });

  $('.home-button').on('click', function(){
    window.location.href = "/movies";
  });

});
