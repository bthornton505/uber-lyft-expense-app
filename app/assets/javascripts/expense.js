$(function () {
  postComment();
});

function postComment() {
  $('#new_comment').on('submit', function(e) {
    e.preventDefault();
    let data = $(this).serialize();
    url = this.action
    // console.log(data)

    $.ajax({
      type: "POST",
      url: url,
      data: data,
      success: function(response) {
        console.log(response)
      }
    })
  })
};
