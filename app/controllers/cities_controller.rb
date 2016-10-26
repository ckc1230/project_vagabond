class CitiesController < ApplicationController

	def index
		@cities = City.all
	end

	def show
		@city = City.friendly.find(params[:id])
		@posts = @city.posts
	end

end
