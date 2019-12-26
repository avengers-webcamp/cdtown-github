class Users::UserCdsController < ApplicationController

    before_action :authenticate_user!
	before_action :correct_user, only: [:update, :destroy]

	def index
	end


	def create
		cart = UserCd.new(user_cd_params)
		if UserCd.where(cd_id: cart.cd_id).exists?
		    cart_up = UserCd.find_by(cd_id: cart.cd_id)
		    cart_up.disc_count = cart_up.disc_count.to_i + cart.disc_count.to_i
		    cart_up.update(disc_count: cart_up.disc_count)
		    redirect_to user_cds_path
		else
		    cart.user_id = current_user.id
		    if cart.save!
                flash[:notice] = "カートに追加しました！"
                redirect_to user_cds_path
            else
                redirect_to root_path
            end
        end
	end

	def update
        if  @cart.update(user_cd_params)
            flash[:notice] = "変更しました!"
            redirect_to user_cds_path
        else
	        redirect_to root_path
        end
	end

	def destroy
		@cart.destroy
        redirect_to user_cds_path
	end

	private

	def user_cd_params
		params.require(:user_cd).permit(:user_id, :cd_id ,:disc_count)
	end

	def correct_user
		@cart = UserCd.find(params[:id])
    	if current_user!= @cart.user
    	    redirect_to user_cds_path
        end
    end

end