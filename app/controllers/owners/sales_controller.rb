class Owners::SalesController < ApplicationController

	def index
		@cdorder = CdOrder.all
	end
end
