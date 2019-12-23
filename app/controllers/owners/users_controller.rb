class Owners::UsersController < ApplicationController

	before_action :correct_owner


	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
        @user.update(user_params)
        redirect_to owners_user_path(@user.id)
	end

	private
    def user_params
        params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
        	:post_front, :post_back, :prefecture, :town, :post_number, :condo, :phone_number, :email)
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
