class UsersController < ApplicationController 
    def create
        @user = User.new(user_params)

        if @user.save 
            login!
            # move this to login! metho
            token = Auth.create_token({:username => @user.username, :id => @user.id, :email => @user.email})
            render :json => {
                status: :created,
                logged_in: true,
                token: token,
                user: { :id => @user.id, :username => @user.username, :email => @user.email, :countries => @user.countries },
            }
        else
            render :json => {
                errors: @user.errors.full_messages
            }
        end 
    end 

    private 
    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end 