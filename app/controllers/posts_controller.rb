class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def show
        #@posts = Post.where(:user_id => )
    end
    def new
        @posts = Post.new
        @id = params[:u_id]
    end
    def create
        @posts = Post.new(post_params)
        @posts.save
        
        redirect_to user_path(post_params[:user_id])
    end
    def edit
        @id = params[:u_id]
    end
    def update
        @posts.update(post_params)
        @posts.save

        redirect_to user_path(post_params[:user_id])
    end
    def destroy
        @posts.destroy
        respond_to do |format|
        format.html { redirect_to user_path(@posts.user_id), notice: 'Post was successfully destroyed.' }
        format.json { head :no_content }
    end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @posts = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :user_id)
    end
end
