class StaticController < ApplicationController

    def home
        render json: {status: 'Welcome to your House of Events API'}
    end
    
    
end