class Owners::OrdersController < ApplicationController

	def index
		@order = Order.all
		@cdorder = CdOrder.all
	end

	def show
	end

	def edit
	end

	def update
	end
end
