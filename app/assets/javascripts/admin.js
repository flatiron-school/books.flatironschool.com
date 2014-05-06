// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready (function() {
  $('.chosen-select').chosen({width: "100%"});

  $('.tag.filter .chosen-select').on("change", function() {
   $(this).parents("form").submit();
  });
  $('.search.filter .chosen-select').on("change", function() {
   $(this).parents("form").submit();
  });

  // $("i.fa-edit").click(function(){
  //   $(".edit_book").show();
  // });
})
