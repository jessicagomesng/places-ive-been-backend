class ApplicationController < ActionController::Base
    helper_method :login!

    def login! 
        session[:user_id] = @user.user_id
    end 

    def logged_in?
        !!session[:user_id]
    end 

    def current_user 
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end 

    def authorised_user?
        @user == curent_user 
    end 

    def logout!
        session.clear 
    end 

    def set_user
        @user = User.find_by_id(session[:user_id])
    end 
end

