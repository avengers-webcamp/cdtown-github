class Owners::CdsController < ApplicationController

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
	end

	def edit
	end

	def create
		@cd = Cd.new(cd_params)
		 if@cd.save!
			redirect_to owners_cds_path
	     else
	     	render :new
	     end

	end

	def update
	end

	private
    def cd_params
    params.require(:cd).permit(:name, :jacket_image, :status, :price, :artist_id, :released_at, :label_id, :genre_id, discs_attributes: [:id, :description, :done, :_destroy,
                                                         songs_attributes: [:id, :description, :_destroy]])
    end
end
