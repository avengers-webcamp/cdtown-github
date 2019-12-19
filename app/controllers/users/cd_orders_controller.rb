class Users::CdOrdersController < ApplicationController

	def create
		cd = Cd.find(params[:cd_id])
		order = Order.find(params[:order_id])
		cd_order = CdOrder.new(cd_order_params)
		cd_order.cd_id = cd.id
		cd_order.order_id = order.id

	end

	private

	def cd_order_params
		params.require(:cd_order).permit(:cd_id, :order_id, :total_price, :count, :price, :tax, :disc_count)
	end
end
