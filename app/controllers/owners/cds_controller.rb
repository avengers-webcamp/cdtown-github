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
	end

	def update
	end

	private
    def project_params
    params.require(:project).permit(:name, :description, discs_attributes: [:id, :description, :done, :_destroy,
                                                         songs_attributes: [:id, :description, :_destroy]])
end
