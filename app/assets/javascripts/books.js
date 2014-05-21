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

})

function insertPDF(url, page){
  var bookPDF = new PDFObject({
    url: url,
    pdfOpenParams: {
      page: page
    }
  }).embed("book");

  return bookPDF;
};

function loadPDF(){
  $("div#book[data-pdf-url]").exists(function(){
    var pdfURL = $(this).data("pdf-url");
    var pdfPage = $(this).data("pdf-page")
    insertPDF(pdfURL, pdfPage)
  });
};

$(function(){
  loadPDF();
});

