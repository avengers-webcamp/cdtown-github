class Owners::ArtistsController < ApplicationController

	def create
        @artist = Artist.new(artist_params)
      if  @artist.save
          redirect_to new_owners_create_path
      else
          redirect_to new_owners_create_path
      end
	end

	private
    def artist_params
        params.require(:artist).permit(:name)
    end
end
