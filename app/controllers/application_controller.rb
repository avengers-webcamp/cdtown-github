class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?



  helper_method :current_user_cd


  protected

  def current_user_cd
    if session[:user_cd_id]
      @cart = UserCd.find(session[:user_cd_id])
    else
      @cart = UserCd.create
      session[:user_cd_id] = @cart.id
    end
  end




  def configure_permitted_parameters
    added_attrs = [ :last_name, :first_name, :last_name_kana, :first_name_kana, :post_front, :post_back, :prefecture,
      :town, :post_number, :condo, :phone_number, :email, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
