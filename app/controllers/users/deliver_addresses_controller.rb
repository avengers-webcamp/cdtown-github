class Users::DeliverAddressesController < ApplicationController

	before_action :authenticate_user!
    before_action :correct_user, only: [:new, :create]


	def new
		@deliver_address = DeliverAddress.new
	end

	def create
		@deliver_address = DeliverAddress.new(deliver_address_params)
		@deliver_address.user_id = current_user.id
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

    def correct_user
    	if current_user.id !=  params[:user_id].to_i
    	    redirect_to new_user_deliver_address_path(current_user.id)
        end
    end
end
