class RestaurantsController < ApplicationController
    def index
        @restaurants = Restaurant.all
    end

    def show
        @restaurant = Restaurant.find(params[:id])
    end

    def new
        @restaurant = Restaurant.new
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
        @restaurants.restaurant = @restaurant
        @restaurant.save
        redirect_to restaurant_path(@restaurant)
    end

    private

    def find_restaurant
        @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def restaurant_params
        params.require(:restaurant).permit(:content)
    end
end
