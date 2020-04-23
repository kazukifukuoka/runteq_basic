$(function() {
  $(document).on("click", ".js-edit-comment-button", function() {

    const commentId = $(this).data("comment-id");
    const comment = $("#js-comment-" + commentId);
    const commentTextArea = $("#js-textarea-comment-box-" + commentId);
    const commentError = $(".error_messages");
    comment.hide();
    commentTextArea.show();
    commentError.hide();
  });

  $(document).on("click", ".comment-cancel-button", function() {
    const commentId = $(this).data("cancel-id");
    const comment = $("#js-comment-" + commentId);
    const commentTextArea = $("#js-textarea-comment-box-" + commentId);

    comment.show();
    commentTextArea.hide();
  });

  $(document).on("click", ".comment-update-button", function() {
    const commentId = $(this).data("update-id");
    const textField = $("#js-textarea-comment-" + commentId);
    const body = textField.val();

    $.ajax({
      url: " /comments/" + commentId,
      type: "PATCH",
      data: {
        comment: {
          body: body
        }
      }
    }).done(function(data) {
      const comment = $("#js-comment-" + commentId);
      const commentTextArea = $("#js-textarea-comment-box-" + commentId);

      comment.show();
      comment.text(data.body);
      commentTextArea.hide();
    }).fail(function(data) {
      const commentError = $(".error_messages");
      commentError.show();
    })
  });
});