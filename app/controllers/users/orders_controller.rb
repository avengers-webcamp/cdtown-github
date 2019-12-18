class Users::OrdersController < ApplicationController

	def new
		@cart = UserCd.all
		@order = Order.new
		@adress = Order.includes(:user,params[:user_id]).order("users.last_name desc")

	end

	def show
		@order = Order.find(params[:id])
		@cd = Cd.find(params[:cd_id])
	end

	def index
		@orders = Order.all
		@cds = Cd.all
	end

	def complete
	end

    private

    def order_params
    	params.require(:oeder).prmit(:user_id, :shipping_day, :postage, :post_front, :post_back, :prefecture, :town, :post_nambar, :condo, :payment, :shipping_status)
    end

end
