class Owners::GenresController < ApplicationController

	def create
        @genre = Genre.new(genre_params)
      if  @genre.save
          redirect_to new_owners_create_path
      else
          redirect_to new_owners_create_path
      end
	end

	private
    def genre_params
        params.require(:genre).permit(:name)
    end

end
