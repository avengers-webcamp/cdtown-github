class Users::OrdersController < ApplicationController

	def new
		@cart = UserCd.all
		@order = Order.new
		@user = User.find(params[:user_id])
		@adress = Order.includes(:user,params[:user_id]).order("users.last_name desc")
		@cart = UserCd.where(user_id: current_user.id)
		@deliver_addresses = DeliverAddress.all
	end

	def show
		@order = Order.find(params[:id])
		@cd = Cd.find(params[:cd_id])
		@cd_order = @cd.user
	end

	def index
		@orders = Order.all
		@cds = Cd.all
		@cd_orders = @cds.user
	end

	def complete
	end

	def create
		@order = Order.new(order_params)
		if @order.save
			redirect_to user_complete
		else
			render :new
		end
	end

    private

    def order_params
    	params.require(:oeder).prmit(:user_id, :shipping_day, :postage, :post_front, :post_back, :prefecture, :town, :post_nambar, :condo, :payment, :shipping_status)
    end

end
