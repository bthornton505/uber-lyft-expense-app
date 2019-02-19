$(function () {
  postComment();
});

function postComment() {
  $('#add-comment').on('click', function(e) {
    e.preventDefault();
    console.log(this);
  })
};
