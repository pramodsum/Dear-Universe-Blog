ActiveAdmin.register Comment do

  controller do

    def delete
      @post = Post.find(params[:post_id])
      @comment = post.comments.find(params[:id])
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to @post.comments, notice: 'Comment was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end
end
