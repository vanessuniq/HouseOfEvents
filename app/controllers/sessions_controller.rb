class SessionsController < ApplicationController
    respond_to :json
    # create session / login
    def create
        user = User.find_by(email: login_params[:email])
        if user && user.authenticate(login_params[:password])
            #render json: user
            respond_with User, json: user
        else
            #render json: {status: 401}
            respond_with status: 401
        end
    end
    
    private
    def login_params
        params.require(:user).permit(:email, :password)
    end
    
end