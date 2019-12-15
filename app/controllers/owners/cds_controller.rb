class Owners::CdsController < ApplicationController
		protect_from_forgery except: :create

	def new
		@cd = Cd.new
		@disc = @cd.discs.build
		@song = @disc.songs.build
	end

	def index
		@cd = Cd.new
		@cds = Cd.all

	end

	def show
		@cd = Cd.find(params[:id])
		@artists = Artist.select("name")
		@genres = Genre.select("name")
		@labels = Label.select("name")
	end

	def edit
		@cd = Cd.find(params[:id])
	end

	def create
		@cd = Cd.new(cd_params)
		 if @cd.save!
			redirect_to owners_cds_path
	     else
	     	render :new
	     end
	end

	def update
		@cd = Cd.find(params[:id])
		@cd.update(cd_params)
		if @cd.update(cd_params)
			redirect_to owners_cd_path(@cd.id)
		else
		  @cds = Cd.all
		  rebder :edit
		end
	end

	private
    def cd_params
    params.require(:cd).permit(:name, :jacket_image, :status, :price, :artist_id, :released_at, :label_id, :genre_id, discs_attributes: [:id, :disc_count, :description, :done, :_destroy,
                                                         songs_attributes: [:id, :name, :order, :description, :_destroy]])
    end
end
