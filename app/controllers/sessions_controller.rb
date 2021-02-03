class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:create]

    # create session / login
    def create
        user = User.find_by(email: login_params[:email])
        if user && user.authenticate(login_params[:password])
            session[:user_id] = user.id
            render json: {logged_in: true, user: UserSerializer.new(user)}, status: 200
        else
           
            render json: {errors: ['invalid email or password']}, status: 401
        end
    end
    def auto_login
        
        render json: {logged_in: true, user: UserSerializer.new(current_user)}
        
    end
    # logout
    def destroy
        session.delete('user_id')
        render json: {logged_out: true}, status: 200
    end
    
    
    private
    def login_params
        params.require(:user).permit(:email, :password)
    end
    
end