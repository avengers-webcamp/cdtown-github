class Users::UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def edit

	end

	def destroy
	end


	private
    def user_params
        params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
        	:post_front, :post_back, :prefecture, :town, :post_number, :condo, :phone_number)
    end

end
