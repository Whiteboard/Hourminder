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
//= require_tree .


$('.status-card').on('mousemove', function(e){
  var cardOffsets = $(this).offset();
  var xOff = cardOffsets.left;
  var yOff = cardOffsets.top;
  var x = e.pageX - xOff,
      y = e.pageY - yOff,
      w = $(this).outerWidth(),
      h = $(this).outerHeight(),
      cx = w/2,
      cy = h/2,
      vx = (x - cx) / w,
      vy = (y - cy) / h;
  console.log(xOff, yOff);
  $(this).css({
    'transform': 'rotateX(' + (vy * 5) + 'deg) rotateY(' + (vx * 10) + 'deg) scale(1.05)'
  });
}).on('mouseout', function(){
  $(this).css({
    'transform': 'rotateX(0deg) rotateY(0deg) scale(.99)'
  });
});
