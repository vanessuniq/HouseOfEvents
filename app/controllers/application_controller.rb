class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    before_action :require_login
    def current_user
        @user = User.find_by(id: session[:user_id])
        
    end

    def logged_in?
        !!current_user
    end
    
    def require_login
        render json: { logged_in: false }, status: :unauthorized unless logged_in?
    end
    
    
end
