class CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :edit, :update, :destroy]

    def show
        #@posts = Post.where(:user_id => )
    end
    def new
        @comments = Comment.new
        @id = params[:p_id]
    end
    def create
        @comments = Comment.new(comment_params)
        @comments.save
        
        redirect_to post_path(comment_params[:post_id])
    end
    def edit
        @id = params[:p_id]
    end
    def update
        @comments.update(comment_params)
        @comments.save

        redirect_to post_path(comment_params[:post_id])
    end
    def destroy
        @comments.destroy
        respond_to do |format|
        format.html { redirect_to post_path(@comments.post_id), notice: 'Post was successfully destroyed.' }
        format.json { head :no_content }
    end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comments = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment, :post_id)
    end
end
