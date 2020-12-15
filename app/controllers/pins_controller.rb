class PinsController < ApplicationController 
    def create 
        pin = Pin.new
        pin.user_id = params[:pin][:userId]
        pin.img = params[:pin][:img]
        pin.location = params[:pin][:location] 
        pin.caption = params[:pin][:caption]
        pin.xCoord = params[:pin][:xPerc]
        pin.yCoord = params[:pin][:yPerc]

        pin.save

        render :json => pin, except: [:created_at, :updated_at]
    end 
    
    def index
        user = User.find_by_id(params["user_id"])
        pins = user.pins 

        render :json => pins, :except => [:created_at, :updated_at]
    end 

    def update 
        pin = Pin.find_by_id(params["pin"]["id"])
        if pin.update(:img => params["pin"]["img"], :location => params["pin"]["location"], :caption => params["pin"]["caption"])
            render :json => pin, except: [:created_at, :updated_at]
        else 
            render :json => { message: 'Something went wrong. Please try again.' }
        end 
    end

    def destroy 
        pin = Pin.find_by_id(params[:id])
        pin.destroy

        render :json => pin
    end 

end