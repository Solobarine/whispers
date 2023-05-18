class ApplicationController < ActionController::Base
    helper_method :current_user
    
    def current_user
        return User.find(1)
    end
end
