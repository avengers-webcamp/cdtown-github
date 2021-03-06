class Owners::CdsController < ApplicationController

	before_action :correct_owner


	def new
		@cd = Cd.new
		@disc = Disc.new
		@song = Song.new
	end

	def index
		@cd = Cd.new
		@cds = Cd.all
		arrival = Arrival.all
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
		@cd.stock = 0
		 if @cd.save
		 	flash[:notice] = "CDを登録しました!"
			redirect_to owners_cd_path(@cd.id)
	     else
	     	render :new
	     end
	end

	def update
		@cd = Cd.find(params[:id])
		if @cd.update(cd_params)
			flash[:notice] = "変更しました!"
			redirect_to owners_cd_path(@cd.id)
		else
		  render :edit
		end
	end

	def destroy
		@cd = Cd.find(params[:id])
		@cd.destroy
		redirect_to owners_cds_path
	end

	private
    def cd_params
    params.require(:cd).permit(:name, :jacket_image, :status, :price, :artist_id, :released_at, :label_id, :genre_id, discs_attributes: [:id, :disc_count, :description, :done, :_destroy,
                                                         songs_attributes: [:id, :name, :order, :description, :_destroy]])
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



