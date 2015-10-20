var path = window.location.pathname;
var port = window.location.port;
var host_name = window.location.hostname;
var url;

var dispatcher;

if (port != ""){
  url = host_name + ":" + port + "/websocket";
} else {
  url = host_name + "/websocket"
}


dispatcher = new WebSocketRails(url);

channel = dispatcher.subscribe('comments');

channel.bind('new', function(comment){
  var type = comment.target_type.toLowerCase();
  var check_path = type +"s/"+comment.target_id;
  console.log('a new comment for ' + type + '#' + comment.target_id +' have arrived!');
  //if path is equal to posts'path then it will add comment
  //
  if (path.indexOf(check_path) > -1){
    $(".main-part").after("<div class='comment' id=comment_" + comment.id + "><p><b>Author: </b>" 
      + comment.author_name + "</p><br><p>" + comment.content 
      + "</p><a href=/comments/"+ comment.id + " class='btn btn-danger pull-right' data-method='delete'>Delete</a></div>");
  }
});

channel.bind('destroy',function(comment){
  console.log('deleted comment ' + comment.id);
  $("#comment_"+comment.id).remove();
});
