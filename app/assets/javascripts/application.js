// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require select2
//= require jqcloud
//= require_tree .
//= require websocket_rails/main

var path;

var path = window.location.pathname;
var dispatcher;

dispatcher = new WebSocketRails('localhost:3000/websocket');
//change localhost for real URL like in example below
//dispatcher = new WebSocketRails('peaceful-wave-5002.herokuapp.com/websocket');
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
