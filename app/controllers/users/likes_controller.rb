class Users::LikesController < ApplicationController
      before_action :set_variables

  def like
      like = current_user.likes.new(cd_id: @cd.id)
      like.save
  end

  def unlike
      like = current_user.likes.find_by(cd_id: @cd.id)
      like.destroy
  end

  private

  def set_variables
      @cd = Cd.find(params[:cd_id])
      @id_name = "#like-link-#{@cd.id}"
  end

end
