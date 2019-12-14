class Users::DeliverAddressesController < ApplicationController

	def new
		@deliver_address = DeliverAddress.new
	end

	def create
		deliver_address = DeliverAddress.new(deliver_address_params)
		deliver_address.save
		redirect_to new_order_path
	end

	private

	def deliver_address_params
		params.require(:deliver_address).permit(:deliver_post_front, :deliver_post_back, :deliver_prefecture, :deliver_town, :deliver_post_number, :deliver_condo)
	end
end
