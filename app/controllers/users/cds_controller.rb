class Users::CdsController < ApplicationController

	def show
		@cd = Cd.find(params[:id])
		@artists = Artist.select("name")
		@genres = Genre.select("name")
		@labels = Label.select("name")
		@user_cd = UserCd.new

		  @stock_array = []
          @cds.stock.times do |quantity|
          	if quantity < 10                          #quantityが10未満かどうか？
               @stock_array += quantity + 1
            else
               break                                   #ループを抜ける
            end
          end
	end

	def index
		@cds = Cd.all
		@user_cd = UserCd.new
	end


	private
    def cd_params
    params.require(:cd).permit(:name, :jacket_image, :status, :price, :artist_id, :released_at, :label_id, :genre_id, discs_attributes: [:id, :disc_count, :description, :done, :_destroy,
                                                         songs_attributes: [:id, :name, :order, :description, :_destroy]])
    end
end
