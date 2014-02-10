class WelcomeController < ApplicationController
  def index
  		@restaurants = Restaurant.all
		if params[:search]
			@restaurants = Restaurant.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
		else
			@restaurants = Restaurant.find(:all)
		end
  end
end
