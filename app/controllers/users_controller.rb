class UsersController < ApplicationController
    def index
        render 'index'
    end

    def show
        render 'user'
    end
end
