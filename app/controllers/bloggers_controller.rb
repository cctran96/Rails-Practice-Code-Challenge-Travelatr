class BloggersController < ApplicationController

    before_action :find_blogger, only: [:show, :edit, :update]

    def index
        @bloggers = Blogger.all
    end

    def show
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.new(blogger_params)
        if @blogger.save
            redirect_to @blogger
        else
            render :new
        end
    end

    private

    def find_blogger
        @blogger = Blogger.find(params[:id])
    end

    def blogger_params
        
    end
end