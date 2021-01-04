class SessionsController < ApplicationController 

    def create 
        @user = User.find_by(:username => session_params[:username])
        if @user && @user.authenticate(session_params[:password])
            token = Auth.create_token({:username => @user.username, :id => @user.id, :email => @user.email})

            render :json => {
                logged_in: true,
                user: { :id => @user.id, :username => @user.username, :email => @user.email, :countries => @user.countries },
                token: token,
                status: 200
            }
            login!

        else 
            render :json => {
                status: 404,
                errors: ["Username or password is not recognised. Please try again"]
            }
        end 
    end 

    def is_logged_in?
        if logged_in? && current_user 
            render :json => {
                logged_in: true,
                user: current_user
            }
        else
            render :json => {
                logged_in: false,
                message: 'no such user'
            }
        end 
    end 

    def destroy
        logout!
        render :json => {
            status: 200,
            logged_in: false
        }
    end 

    private 
    def session_params 
        params.require(:user).permit(:username, :password)
    end

end 