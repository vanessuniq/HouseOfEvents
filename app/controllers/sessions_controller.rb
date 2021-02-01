class SessionsController < ApplicationController
    # create session / login
    def create
        user = User.find_by(email: login_params[:email])
        if user && user.authenticate(login_params[:password])
            session[:user_id] = user.id
            render json: {logged_in: true, user: user}, status: :created
        else
            #render json: {status: 401}
            render json: {errors: ['invalid email or password']}, status: 401
        end
    end
    
    private
    def login_params
        params.require(:user).permit(:email, :password)
    end
    
end