class Owners::LabelsController < ApplicationController
	def new
		@label = Label.new
	end

	def create
		@label = Label.new(label_params)
      if  @label.save
          redirect_back(fallback_location: root_path)
      else
          redirect_back(fallback_location: root_path)
      end
	end

	private
    def label_params
        params.require(:label).permit(:name)
    end
end
