class PostsController < ApplicationController
    def index
        render 'index'
    end

    def show
        render 'post'
    end
end
