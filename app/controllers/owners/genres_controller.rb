class Owners::GenresController < ApplicationController

  before_action :correct_owner


  def index
      @genres = Genre.all
    end
  def show
      @genre = Genre.find(params[:id])
  end
	def create
        @genre = Genre.new(genre_params)
      if  @genre.save
          flash[:notice] = "ジャンルを登録しました!"
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

    def correct_owner
      if current_owner.nil?
          if user_signed_in?
              redirect_to root_path
          else
            redirect_to new_user_session_path
          end
        end
    end

end
