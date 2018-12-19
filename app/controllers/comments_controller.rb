class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params) if @comment.valid?
  end

  private

  def comment_params
    params.require(:comment).permit(:description)
  end

end
