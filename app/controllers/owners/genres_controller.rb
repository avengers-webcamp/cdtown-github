class Owners::GenresController < ApplicationController
	def new
		@genre = Genre.new
	end

	def create
        @genre = Genre.new(genre_params)
      if  @genre.save
          redirect_back(fallback_location: root_path)
      else
          redirect_back(fallback_location: root_path)
      end
	end

	private
    def genre_params
        params.require(:genre).permit(:name)
    end

end
