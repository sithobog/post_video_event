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
var dispatcher = new WebSocketRails('localhost:3000/websocket');
channel = dispatcher.subscribe('comments');
channel.bind('new', function(comment){
	var check_path = comment.target_type.toLowerCase()+"s/"+comment.target_id;
	console.log('a new comment about ' + comment.id + ' arrived!');
	if (path.indexOf(check_path) > -1){
		$(".comment-form").before("<p>TEST CASE</p>");
	}
});
//channel.bind('destroy',function(comment){
//	console.log('deleted comment ' + comment.id);
//	$("#comment_"+comment.id).remove();
//});

