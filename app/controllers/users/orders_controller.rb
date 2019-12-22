class Users::OrdersController < ApplicationController

	before_action :authenticate_user!
	before_action :correct_user

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
		@orders = Order.where(user_id: current_user.id)

		@cd_orders = CdOrder.all
	end

	def complete
	end

	def create
		@cart = UserCd.where(user_id: current_user.id)
		@deliver_addresses = DeliverAddress.where(user_id: current_user.id)
		@user = User.find(params[:user_id])
		@order = Order.new(order_params)
		@order.user_id = current_user.id
		if params[:deli] == "user"
			@order.last_name = @user.last_name
		    @order.first_name = @user.first_name
		    @order.post_front = @user.post_front
		    @order.post_back = @user.post_back
		    @order.prefecture = @user.prefecture
		    @order.town = @user.town
		    @order.post_number = @user.post_number
		    @order.condo = @user.condo
		elsif params[:deli].present?
		    @deliver_address = DeliverAddress.find(params[:deli])
		    @order.last_name = @deliver_address.deliver_last_name
		    @order.first_name = @deliver_address.deliver_first_name
		    @order.post_front = @deliver_address.deliver_post_front
		    @order.post_back = @deliver_address.deliver_post_back
		    @order.prefecture = @deliver_address.deliver_prefecture
		    @order.town = @deliver_address.deliver_town
		    @order.post_number = @deliver_address.deliver_post_number
		    @order.condo = @deliver_address.deliver_condo
		else
		end

		#@cart.each do |cart|
	        #if cart.cd.stock < cart.disc_count
	        	#redirect_to user_cd_path(@cart),notice:'申し訳ございません。ただ今品切れ中です。'
	        #end
	    #end

		if @order.save
		    @cart = UserCd.where(user_id: current_user.id)

		    @cart.each do |cart|

			    cd_order = CdOrder.new(cd_order_params)
		        cd_order.cd_id = cart.cd.id
		        cd_order.order_id = @order.id
		        cd_order.save

		        cart.cd.stock = cart.cd.stock.to_i - cd_order.disc_count.to_i
			    cart.cd.update(stock: cart.cd.stock)

                cart.destroy
		    end
			    redirect_to user_complete_path(@user)

		else
			render :new
		end
		@submit = "注文する"
	end

    private

    def order_params
    	params.require(:order).permit(:user_id, :user_cd_id, :deliver_address_id, :shipping_day, :postage, :last_name, :first_name, :post_front, :post_back, :prefecture, :town, :post_number, :condo, :payment, :shipping_status)
    end

    def cd_order_params
		params.require(:order).permit(:cd_id, :order_id, :total_price, :count, :price, :tax, :disc_count)
	end

	def correct_user
    	if current_user.id !=  params[:user_id].to_i
    	    redirect_to user_cds_path
        end
    end

end
