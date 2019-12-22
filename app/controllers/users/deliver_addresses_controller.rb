class Users::DeliverAddressesController < ApplicationController

	before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update]


	def new
		@deliver_address = DeliverAddress.new
	end

	def create
		@deliver_address = DeliverAddress.new(deliver_address_params)
		@deliver_address.user_id = current_user.id
		user = User.find(params[:user_id])
		if  @deliver_address.save
		    redirect_to new_user_order_path
		else
			render :new
		end
	end

	private

	def deliver_address_params
		params.require(:deliver_address).permit(:user_id, :deliver_last_name, :deliver_first_name, :deliver_post_front, :deliver_post_back, :deliver_prefecture, :deliver_town, :deliver_post_number, :deliver_condo)
	end

	def current_user?(user)
        user == current_user
    end

    def correct_user
    	@user = User.find(params[:user_id])
        redirect_to new_user_deliver_address(current_user.id) unless current_user?(@user)
    end
end
