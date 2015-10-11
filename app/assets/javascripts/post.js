var ready;

ready = function(){
  $("#tag_ids").select2({ tags: true, theme: "bootstrap" });
};

$(document).ready(ready);
/**
 * if using turbolinks
 */
$(document).on('page:load', ready);
