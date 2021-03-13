class RestaurantSearchController < ApplicationController

    def index
        render json: YelpSearch.new(params[:categories], params[:location]).call
    end

end