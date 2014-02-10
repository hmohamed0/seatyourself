class RestaurantsController < ApplicationController
	def new
		@restaurant = Restaurant.new
  	end

  	def edit
  		@restaurant = Restaurant.find(params[:id])
  	end

	def index
		@restaurants = Restaurant.all
		if params[:search]
			@restaurants = Restaurant.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
		else
			@restaurants = Restaurant.find(:all)
		end
	end

	def create
  		@restaurant = Restaurant.new(params[:restaurant].permit(:name))

		if @restaurant.save
		    redirect_to @restaurant
		else
		  	render 'new'
	  	end
	end

	def show
  		@restaurant = Restaurant.find(params[:id])
	end

	def update
  		@restaurant = Restaurant.find(params[:id])

  		if @restaurant.update(params[:restaurant].permit(:name))
    		redirect_to @restaurant
  		else
    		render 'edit'
  		end
	end

	def destroy
  		@restaurant = Restaurant.find(params[:id])
  		@restaurant.destroy

  		redirect_to restaurants_path
	end

	private
  		def restaurant_params
    		params.require(:restaurant).permit(:name)
  		end
end
