class Users::OrdersController < ApplicationController

	def new
		@order = Order.new
		@user = User.find(params[:user_id])
		@adress = Order.includes(:user,params[:user_id]).order("users.last_name desc")
		@cart = UserCd.where(user_id: current_user.id)
		@deliver_addresses = DeliverAddress.where(user_id: current_user.id)
		@karamu = :post_front, :post_back, :prefecture, :town, :post_nambar, :condo
		@address = @user.post_front, @user.post_back, @user.prefecture, @user.town, @user.post_number, @user.condo
	end

	def show
		@order = Order.find(params[:id])
		@cd = Cd.find(params[:cd_id])
		@cd_order = @cd.user
	end

	def index
		@orders = Order.all
		@cds = Cd.all
	end

	def complete
	end

	def create
		@cart = UserCd.where(user_id: current_user.id)
		@deliver_addresses = DeliverAddress.where(user_id: current_user.id)
		@user = User.find(params[:user_id])
		@order = Order.new(order_params)
		if params[:deli] = "user"
		    @order.post_front = @user.post_front
		    @order.post_back = @user.post_back
		    @order.prefecture = @user.prefecture
		    @order.town = @user.town
		    @order.post_nambar = @user.post_number
		    @order.condo = @user.condo
		else
		    @deliver_addresses = DeliverAddress.find(params[:deli])
		    @order.post_front = @deliver_addresses.deliver_post_front
		    @order.post_back = @deliver_addresses.deliver_post_back
		    @order.prefecture = @deliver_addresses.deliver_prefecture
		    @order.town = @deliver_addresses.deliver_town
		    @order.post_nambar = @user.deliver_post_number
		    @order.condo = @deliver_addresses.deliver_condo
		end
		@order.user_id = current_user.id

		if @order.save!
		    @cart = UserCd.where(user_id: current_user.id)

		    @cart.each do |cart|

			cd_order = CdOrder.new(cd_order_params)
		    cd_order.cd_id = cart.cd.id
		    cd_order.order_id = @order.id
		    cd_order.save!
            cart.destroy
		    end
			    redirect_to user_complete_path(@user)

		else
			render :new
		end
	end

    private

    def order_params
    	params.require(:order).permit(:user_id, :shipping_day, :postage, :post_front, :post_back, :prefecture, :town, :post_nambar, :condo, :payment, :shipping_status)
    end

    def cd_order_params
		params.require(:order).permit(:cd_id, :order_id, :total_price, :count, :price, :tax, :disc_count)
	end

end
