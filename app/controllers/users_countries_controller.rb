class UsersCountriesController < ApplicationController
    def create
        # rename 
        user = User.find_by_id(params["users_country"]["userID"])

        visit = UsersCountry.all.detect { |uc| 
        uc.user_id == params["users_country"]["userID"] && uc.country_id == params["users_country"]["countryID"]
        }

        if visit 
            visit.destroy 
            render :json => { 
                user: { :id => user.id, :username => user.username, :email => user.email, :countries => user.countries }
            } 

        else visit = UsersCountry.new(:user_id => user.id, :country_id => params["users_country"]["countryID"])

            if visit.save
                render :json => {
                    user: { :id => user.id, :username => user.username, :email => user.email, :countries => user.countries },
                    visit: visit
                }
            else 
                render :json => {
                    status: 500
                }
            end 
        end
    end 

    def destroy 
    end 

    private 
    def users_countries_params 
        params.require(:users_country).permit(:userID, :countryID)
    end 
end 