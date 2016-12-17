class MoviesController < ApplicationController

	def index
	end

	def new
	end

	def create

		@movie = Movie.new

		@movie.movieName = params[:movieName]
		@movie.price = params[:priceStr].to_f
		@movie.linkAddress = "NULL"
		@movie.picAddress = "NULL"
		@movie.description = params[:description]

		@movie.save

		@movie.update linkAddress: ("/movies/" + @movie.id.to_s)

		redirect_to @movie

	end

	def show

		@movie = Movie.find(params[:id])

	end

	def manage

		@movies = Movie.all
		
	end

end
