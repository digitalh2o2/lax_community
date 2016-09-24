$(document).ready(function(){
  $('.js-comment').on('click',function(event){

    var id = $(this).data("id")
    $.get("/comments/" + id + ".json",function(data){
      var content = data["content"]
      $("#content").text(content);
    });
  });
});
