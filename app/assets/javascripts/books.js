// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
//
//
$(document).ready (function() {
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

  $('.switch').click(function() {
    var val = $("#sort_by").val();
    if( val === "book") {
      $("#sort_by").val("user");
      $("#books_by_user_chosen").show();
      $("#users_by_book_chosen").hide();
    } else {
      $("#sort_by").val("book");
      $("#books_by_user_chosen").hide();
      $("#users_by_book_chosen").show();
    }
  });
})
