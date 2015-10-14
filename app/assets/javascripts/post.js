var ready, apply_style_for_post;
var css_style = gon.css_style

apply_style_for_post = function(){
	$(".post_style").css({'background-color': css_style["bgcolor"],
												'color': css_style["color"],
												'font-size': css_style["font_size"]+"px"});
}


ready = function(){
  $("#tag_ids").select2({theme: "bootstrap" });
  apply_style_for_post();
};



$(document).ready(ready);

window.onload = ready;
