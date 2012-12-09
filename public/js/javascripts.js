$(function() {
  $("#sortable").nestedSortable({
    listType: 'ul',
    items: 'li',
    placeholder: "highlight",
    forcePlaceholderSize: true,
    handle: 'span',
    helper: 'clone',
    opacity: .6,
    revert: 250,
    tabSize: 25,
    tolerance: 'pointer',
    toleranceElement: '> span'
  });
  $("#sortable").disableSelection();

  $(".autogrow").autoGrow();

});

function updatePositions(path) {
  var c = {set : JSON.stringify($('#sortable').nestedSortable('toHierarchy', {startDepthCount: 0}))};
  $.post(path, c, function(data){
    response = JSON.parse(data);
    if (response.status == true) {
      flash_class = "flash_notice";
    } else {
      flash_class = "flash_error";
    }
    $('.flashes').remove();
    $('#title_bar').after('<div class="flashes"><div class="flash ' + flash_class + '">'+ response.message +'</div></div>');
    setTimeout(function() {
      $(".flashes").remove();
    }, 5000);
  });
  return false;
}
