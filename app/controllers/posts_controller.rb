class PostsController < ApplicationController

    before_action :find_post, only: [:show, :update, :edit, :like]

    def index
        @posts = Post.all
    end

    def show
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to @post
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @post.update(post_params)
            redirect_to @post
        else
            render :edit
        end
    end

    def like
        likes = @post.likes
        @post.update(likes: likes + 1)
        redirect_to @post
    end

    private

    def find_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content, :blogger_id, :destination_id, :likes)
    end
end