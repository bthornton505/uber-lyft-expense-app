$(document).ready(function() {
  addComment();
});

const addComment = () => {
  $('#new_comment').on('submit', function(e) {
    let data = $(this).serialize();
    url = this.action

    $.ajax({
      type: "POST",
      url: url,
      data: data,
      success: function(response) {
        $('#comment_description').val("");
        let $ul = $('#expense-comments')
        $ul.append(response);
      }
    })

    e.preventDefault();
  })
};
