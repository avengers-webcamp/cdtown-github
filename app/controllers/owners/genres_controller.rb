class Owners::GenresController < ApplicationController
	def new
		@genre = Genre.new
	end

	def create
        @genre = Genre.new(genre_params)
      if  @genre.save
          redirect_to owners_create_path
      else
          redirect_to owners_create_path
      end
	end

	private
    def genre_params
        params.require(:genre).permit(:name)
    end

end
