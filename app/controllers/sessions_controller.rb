class SessionsController < ApplicationController 

    def create 
        @user = User.find_by(:username => session_params[:username])
        if @user && @user.authenticate(session_params[:password])
            token = Auth.create_token({:username => @user.username, :id => @user.id, :email => @user.email})
            # returned_user = Auth.decode_token(token)
            # created_jwt = issue_token({ :id => @user.id })
            # cookies.signed[:jwt] = { 
            #     :value => token, 
            #     :httponly => true,
            #     :expires => 1.hour.from_now }
            render :json => {
                logged_in: true,
                user: { :id => @user.id, :username => @user.username, :email => @user.email, :countries => @user.countries },
                token: token,
                # user: { :id => @user.id, :username => @user.username, :email => @user.email, :countries => @user.countries },
                status: 200
            }
            # token = Auth.create_token({:username => @user.username, :id => @user.id, :email => @user.email})
            # returned_user = Auth.decode_token(token)
            # render :json => {
            #     logged_in: true,
            #     user: returned_user[0]['user'],
            #     status: 200,
            #     # token: token
            # }
            login!
            # render :json => {
            #     logged_in: true,
            #     user: { :id => @user.id, :username => @user.username, :email => @user.email, :countries => @user.countries }
            # }
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