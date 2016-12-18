require 'uuidtools'

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

		self.handleFile @movie, params[:moviePic]

		redirect_to @movie

	end

	def show

		@movie = Movie.find(params[:id])

	end

	def manage

		@movies = Movie.all

	end

	def addMovieToMovieColumn

		respond_to do |format|

			# format.html { render action: :new}

			# format.js {}

			format.json { render json: {result: :success} 

		end
	end

	def handleFile movie_object, uploaded

		gen_uuid = UUIDTools::UUID.timestamp_create.to_s

		File.open(Rails.root.join('public', 'images', 'uploads', gen_uuid), 'wb') do |file|
			file.write(uploaded.read)
		end

		movie_object.update picAddress: "uploads/" + gen_uuid

	end

	# Reference of accepting the file uploaded.
=begin
	def upload
	  uploaded_io = params[:person][:picture]
	  File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
	    file.write(uploaded_io.read)
	  	end
	end
=end

end
