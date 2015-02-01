// $(document).on("page:change", function(){
//   alert("hiii");
// });


//
$(document).on("click", ".image-pop", function() {
  var str = $(this).children('img:first').attr('src');
  var res = str.replace("square", "original");
  $('#imagepreview').attr('src', res);
  $('#download-link').attr('href', res);
  $('#imagemodal').modal('show');
});
