class Users::UsersController < ApplicationController

    before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])

	end

	def update
  	    @user = User.find(params[:id])
        if @user.update(user_params)
           redirect_to user_path(@user.id)
        else
            render :edit
        end
    end

    def unsubscribe
    	@user = User.find(params[:id])

    end

	def destroy
		@user = User.find(params[:id])
        @user.destroy
        redirect_to cds_path
	end


	private
    def user_params
        params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
        	:post_front, :post_back, :prefecture, :town, :post_number, :condo, :phone_number)
    end

end
