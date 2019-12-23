class Owners::GenresController < ApplicationController

  def index
      @genres = Genre.all
    end
  def show
      @genre = Genre.find(params[:id])
  end
	def create
        @genre = Genre.new(genre_params)
      if  @genre.save
          redirect_to new_owners_create_path
      else
          redirect_to new_owners_create_path
      end
	end

  def destroy
      genre = Genre.find(params[:id])
      genre.destroy
      redirect_to owners_genres_path
  end

	private
    def genre_params
        params.require(:genre).permit(:name)
    end

end
