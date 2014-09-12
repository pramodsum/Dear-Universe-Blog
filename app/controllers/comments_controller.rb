class CommentsController < ApplicationController
  before_filter :authenticate, :except => [ :index, :show ]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

    def authenticate
      authenticate_or_request_with_http_basic do |name, password|
        name == "admin" && password == "secret"
      end
    end

    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
