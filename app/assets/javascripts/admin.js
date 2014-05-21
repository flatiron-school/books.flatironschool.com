// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready (function() {

  $("#search-switch").iphoneStyle({
    checkedLabel: "BY BOOKS",
    uncheckedLabel: "BY STUDENTS"
  });

  $(document).on("click", '.iPhoneCheckHandleRight, .iPhoneCheckLabelOff, .iPhoneCheckLabelOn', function() {
    if($("#search-switch").prop('checked')) {
      $("#sort_by").val("user");
      $("#books_by_user_chosen").show();
      $("#users_by_book_chosen").hide();
    } else {
      $("#sort_by").val("book");
      $("#books_by_user_chosen").hide();
      $("#users_by_book_chosen").show();
    }
  });

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
