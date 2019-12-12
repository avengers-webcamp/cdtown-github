class Owners::CdsController < ApplicationController

	def new
		@cd = Cd.new
		@disc = @cd.discs.build
		@song = @disc.songs.build
	end

	def index
	end

	def show
	end

	def edit
	end

	def create
		cds = CD.new(cd_params)
		cds.save
		redirect_to root_path
	end

	def update
	end

	private
    def project_params
    params.require(:cd).permit(:name, :description, discs_attributes: [:id, :description, :done, :_destroy,
                                                         songs_attributes: [:id, :description, :_destroy]])
    end
end
