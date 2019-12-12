class Users::DeliverAddressesController < ApplicationController

	def new
		@deliver_address = Deliver_address.new
	end
end
