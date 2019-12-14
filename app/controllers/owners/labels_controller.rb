class Owners::LabelsController < ApplicationController

  def index
      @labels = Label.all
  end

	def create
		  @label = Label.new(label_params)
      if  @label.save
          redirect_to new_owners_create_path
      else
          redirect_to new_owners_create_path
      end
	end

  def destroy
      label = Label.find(params[:id])
      label.destroy
      redirect_to owners_labels_path
  end

	private
    def label_params
        params.require(:label).permit(:name)
    end
end
