class Owners::ArtistsController < ApplicationController

	def new
		@artist = Artist.new
	end


	def create
        @artist = Artist.new(artist_params)
      if  @artist.save
          redirect_back(fallback_location: root_path)
      else
          redirect_back(fallback_location: root_path)
      end
	end

	private
    def artist_params
        params.require(:artist).permit(:name)
    end
end
