class Owners::ArrivalsController < ApplicationController

	def new
		@arrival = Arrival.new
		@cd = Cd.find(params[:cd_id])
	end

	def show

    end

	def index
		@arrivals = Arrival.all
	end

	def create
		@arrival = Arrival.new(arrival_params)
        @cd = Cd.find(params[:cd_id])
        @arrival.cd_id=params[:cd_id]
		if  @arrival.save
		    redirect_to owners_cd_arrivals_path(@cd)
		else
			render :new
		end
	end

	private

	def arrival_params
		params.require(:arrival).permit(:arrive_day, :arrive_count, :cd_id)
	end

end
