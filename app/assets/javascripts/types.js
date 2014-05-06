
$(function () {
  $('#new_type').fileupload({
    dataType: 'script',
    add: function (e, data) {
      var div = $("<div>");
      div.addClass("upload");
      div.addClass("bg-info");
      div.text(" " + data.files[0].name);
      div.appendTo($(".file-container"));
      $("#new_type").submit(function(e) {
        var i = $("<i>");
        i.addClass("fa fa-spin fa-spinner");
        div.prepend(i);
        div.addClass("bg-warning").removeClass("bg-info");
        e.preventDefault();
        data.submit();
      });
    }
  });
});
