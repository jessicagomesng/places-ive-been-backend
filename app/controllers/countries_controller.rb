class CountriesController < ApplicationController 
    before_action :logged_in?, only: [:index]
    
    def create 
    end 

    def index 
        countries = Country.all 
        render :json => countries, :only => [:id, :abbreviation, :name, :path]
    end 
end 
