class Users::UserCdsController < ApplicationController
      before_action :logged_in_user

	def index
	end

	def create
		@cd = Cd.find(params[:cd_id])
        unless @cd.incart?(current_user)
         @cd.incart(current_user)
         respond_to do |format|
           format.html { redirect_to request.referrer || root_url }
           format.js
        end
        end
	end

	def destroy
		@cd = UserCd.find(params[:id]).cd
		if @cd.incart?(current_user)
         @cart.outcart(current_user)
         respond_to do |format|
           format.html { redirect_to request.referrer || root_url }
           format.js
        end
        end
	end


end
