class Owners::ArtistsController < ApplicationController

    def index
    	@artists = Artist.all
    end

	def create
        @artist = Artist.new(artist_params)
      if  @artist.save
          redirect_to new_owners_create_path
      else
          redirect_to new_owners_create_path
      end
	end

	def destroy
  	    artist = Artist.find(params[:id])
        artist.destroy
        redirect_to owners_artists_path
    end

	private
    def artist_params
        params.require(:artist).permit(:name)
    end
end
