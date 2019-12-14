class Users::UserCdsController < ApplicationController

	def index
		@user_cds = User.find(params[:user_cd])
	end

	def create
		user_cd = UserCd.new(user_cd_params)
		user_cd.save
		session[:user_cd] = [] unless session[:user_cd]
        session[:user_cd] << params[:cd_id]
        flash[:success] = "カートに追加できました！"
        redirect_to root_path
	end

	def update
	end

	def destroy
	end

	private

	def user_cd_params
		params.require(:user_cd).permit(:user_id, :cd_id)

end
