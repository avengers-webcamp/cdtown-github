class Owners::LabelsController < ApplicationController
	def new
		@label = Label.new
	end

	def create
		@label = Label.new(label_params)
      if  @label.save
          redirect_to owners_create_path
      else
          redirect_to owners_create_path
      end
	end

	private
    def label_params
        params.require(:label).permit(:name)
    end
end
