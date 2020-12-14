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

        render :json => pins, only: [:id, :caption, :img, :xCoord, :yCoord]
    end 

end