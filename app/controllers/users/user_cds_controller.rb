class Users::UserCdsController < ApplicationController

	def index
		@user = current_user.id
		@cart = UserCd.all
	end

	def create
        cd = Cd.find(params[:cd_id])
        @cart = current_user_cd
		cart = UserCd.new(user_cd_params)
		cart.user_id = current_user.id
        cart.cd_id = cd.id

		if cart.save!
            flash[:success] = "カートに追加できました！"
            redirect_to user_cds_path
        else
            redirect_to root_path
        end
	end

	def update
	end

	def destroy
	end

	private

	def user_cd_params
		params.require(:user_cd).permit(:user_id, :cd_id ,:disc_count)
	end

end
