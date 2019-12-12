class Owners::ArrivalsController < ApplicationController

	def new
		@arrival = Arrival.new
	end

	def index
		@arrivals = Arrival.find(params[:id])
	end

	def create
		arrival = Arrival.new(arrival_params)
		arrival.save
		redirect_to owners_cd_path
	end
	private

	def arrival_params
		params.require(:arrival).permit(:arrive_day, :arrive_count, :stock_count)
	end

end
