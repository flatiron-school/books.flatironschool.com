// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
//
//
$(document).ready (function() {

  function selectAllText(textbox) {
    textbox.focus();
    textbox.select();
  }

  $('.list-group .chosen-select').chosen({width: "70%"});
  $('.chosen-select').chosen({width: "100%"});

  $('.tag.filter .chosen-select').on("change", function() {
   $(this).parents("form").submit();
  });

  $('#users_by_book').on("change", function() {
   $(this).parents("form").submit();
  });

   $('#books_by_user').on("change", function() {
   $(this).parents("form").submit();
  });

  $('.search.filter .chosen-select').on("change", function() {
   $(this).parents("form").submit();
  });

  $('#input-clicker').click(function () {
    $("#type_file").click();
  })

  $('#txtInput').click(function() { 
    selectAllText($(this));
    console.log("clicked");
  });

})
