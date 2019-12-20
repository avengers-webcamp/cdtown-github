class Users::DeliverAddressesController < ApplicationController

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
		params.require(:deliver_address).permit(:user_id, :deliver_post_front, :deliver_post_back, :deliver_prefecture, :deliver_town, :deliver_post_number, :deliver_condo)
	end
end
