class Owners::CreatesController < ApplicationController
	def new
        @label = Label.new
		@artist = Artist.new
		@genre = Genre.new
		render "owners/create"
    end

    def create
        @label = Label.new(label_params)
      if  @label.save
          redirect_to owners_create_url
      else
          redirect_to owners_create_url
      end

        @artist = Artist.new(artist_params)
      if  @artist.save
          redirect_to owners_create_url
      else
          redirect_to owners_create_url
      end

        @genre = Genre.new(genre_params)
      if  @genre.save
          redirect_to owners_create_url
      else
          redirect_to owners_create_url
      end
    end

	private
	def label_params
        params.require(:label).permit(:name)
    end
    def artist_params
        params.require(:artist).permit(:name)
    end
    def genre_params
        params.require(:genre).permit(:name)
    end
end
