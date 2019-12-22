class Users::CdsController < ApplicationController


	def show
		@cd = Cd.find(params[:id])
		@artists = Artist.select("name")
		@genres = Genre.select("name")
		@labels = Label.select("name")
		@user_cd = UserCd.new
	end

	def index
		@cds = Cd.all
		@user_cd = UserCd.new
	end

	def search
		@cd = Cd.search(params[:search])
		@user_cd = UserCd.new
	end


	private

    def cd_params
    params.require(:cd).permit(:name, :jacket_image, :status, :price, :artist_id, :released_at, :label_id, :genre_id, discs_attributes: [:id, :disc_count, :description, :done, :_destroy,
                                                         songs_attributes: [:id, :name, :order, :description, :_destroy]])
    end
end
