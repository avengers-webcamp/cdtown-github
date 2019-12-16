class Owners::ArrivalsController < ApplicationController

	def new
		@arrival = Arrival.new
		@cd = Cd.find(params[:cd_id])
	end

	def index
		@arrivals = Arrival.all
	end

	def create
		arrival = Arrival.new(arrival_params)
		arrival.save
		redirect_to owners_cds_path
	end

	private

	def arrival_params
		params.require(:arrival).permit(:arrive_day, :arrive_count, :stock_count)
	end

end
