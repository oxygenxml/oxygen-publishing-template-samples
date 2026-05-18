document.addEventListener("DOMContentLoaded", function () {
  if ($.fn.maphilight) {
    $.fn.maphilight.defaults = $.extend($.fn.maphilight.defaults, {
      fillColor: 'ffffff',
      fillOpacity: 0,
      strokeColor: '0000ff',
      strokeWidth: 3
      /*stroke: false*/
    });
  }
});
