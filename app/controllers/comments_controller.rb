class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(comment_params)

    if(@comment.author == nil || @comment.author == "")
      @comment.author = "Anonymous"
    end

    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :author)
    end
end
