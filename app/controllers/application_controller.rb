class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token 
        # research this 
    include ::ActionController::Cookies 

    helper_method :login!, :logged_in?, :current_user, :authorised_user, :logout!, :set_user

    def login! 
        session[:user_id] = @user.id
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
        # session.clear 
        # cookies.delete(:jwt, :domain => :all) 
        reset_session
    end 

    def set_user
        @user = User.find_by_id(session[:user_id])
    end 

    def authenticate_user 
        jwt = cookies.signed[:jwt]
        Auth.decode_token(jwt)
    end 
end

