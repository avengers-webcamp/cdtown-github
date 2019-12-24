class Owners::OrdersController < ApplicationController

	before_action :correct_owner


	def index
        @cdorder = CdOrder.all
		@order = Order.all

	end

	def show
	end

	def edit
		@order = Order.find(params[:id])
		@cd_order = CdOrder.where(order_id: params[:id])
	end

	def update
		o = Order.find(params[:id])

        if  o.update(order_params)
            flash[:notice] = "変更しました!"
            redirect_to owners_orders_path
        else
	        redirect_to root_path
        end
	end

	def destroy
		@order = Order.find(params[:id])
		@order.destroy
        redirect_to owners_orders_path
	end

    private
    def order_params
    	params.require(:order).permit(:user_id, :shipping_day, :postage, :last_name, :first_name, :post_front, :post_back, :prefecture, :town, :post_number, :condo, :payment, :shipping_status)
    end
	def cd_order_params
		params.require(:order).permit(:cd_id, :order_id, :total_price, :count, :price, :tax, :disc_count)
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