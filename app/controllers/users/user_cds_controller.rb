class Users::UserCdsController < ApplicationController

	def index
	end

	def show
	  	@user = User.find(params[:id])
<<<<<<< HEAD
=======
	  	@cart = UserCd.where(user_id: current_user.id)
>>>>>>> 9d50e7918d2235525130322f72f3c831234006fd
    end

	def create
        cd = Cd.find(params[:cd_id])
		cart = UserCd.new(user_cd_params)
		cart.user_id = current_user.id
        cart.cd_id = cd.id

		if cart.save!
            flash[:notice] = "カートに追加できました！"
            redirect_to user_cd_path(current_user.id)
        else
            redirect_to root_path
        end
	end

	def update
		cart = UserCd.find(params[:id])

        if  cart.update(user_cd_params)
            flash[:notice] = "successfully"
            redirect_to user_cd_path(current_user.id)
        else
	        redirect_to root_path
        end
	end

	def destroy
		cart = UserCd.find(params[:id])
		cart.destroy
        redirect_to user_cd_path(current_user.id)
	end

	private

	def user_cd_params
		params.require(:user_cd).permit(:user_id, :cd_id ,:disc_count)
	end

end
<<<<<<< HEAD


=======
>>>>>>> 9d50e7918d2235525130322f72f3c831234006fd
