class Users::CdOrdersController < ApplicationController

	def index
	end

	def create
		cart = UserCd.where(user_id: current_user.id)
		order = Order.find(params[:order_id])
		cd_order = CdOrder.new(cd_order_params)
		cd_order.cd_id = cart.id
		cd_order.order_id = order.id
		if cd_order.save!
			redirect_to user_complete_path
		end
	end

	private

	def cd_order_params
		params.require(:cd_order).permit(:cd_id, :order_id, :total_price, :count, :price, :tax, :disc_count)
	end
end
