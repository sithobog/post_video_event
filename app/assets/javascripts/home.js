var ready;
var word_array = gon.from_home_controller

ready = function(){
	$("#tag_cloud").jQCloud(word_array);
};


$(document).ready(ready);
/**
 * if using turbolinks
 */
$(document).on('page:load', ready);
