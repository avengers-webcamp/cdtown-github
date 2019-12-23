class Owners::ArrivalsController < ApplicationController

	before_action :correct_owner


	def new
		@arrival = Arrival.new
		@cd = Cd.find(params[:cd_id])
	end

	def show

    end

	def index
		@cd = Cd.find(params[:cd_id])
		@arrivals = Arrival.where(cd_id: @cd.id)
	end

	def create
		@arrival = Arrival.new(arrival_params)
        @cd = Cd.find(params[:cd_id])
        @arrival.cd_id = params[:cd_id]
		if  @arrival.save
			@cd.stock = @cd.stock.to_i + @arrival.arrive_count.to_i
			if @cd.stock > 1
		        @cd.status = 0
		    end
			@cd.update!(stock: @cd.stock)
		    redirect_to owners_cd_arrivals_path(@cd)
		else
			render :new
		end
	end

	private

	def arrival_params
		params.require(:arrival).permit(:arrive_day, :arrive_count, :cd_id)
	end

    def correct_owner
    	if current_owner.nil?
    	    if user_signed_in?
    	        redirect_to root_path
    	    else
    	    	redirect_to new_user_session_path
    	    end
        end
    end

end
