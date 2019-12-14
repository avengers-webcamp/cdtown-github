class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def current_cart
    return @current_cart if @current_cart.present?

    if current_user.present?
      @current_cart = current_user.user_cd || current_user.user_cd.create
    elsif session[:user_cd_id]
      @current_cart = UserCd.where(id: session[:user_cd_id]).first || UserCd.create
    else
      @current_cart = UserCd.create
      session[:user_cd_id] = @current_cart.id

    return @current_cart
    end
  end


  protected

  def configure_permitted_parameters
    added_attrs = [ :last_name, :first_name, :last_name_kana, :first_name_kana, :post_front, :post_back, :prefecture,
      :town, :post_number, :condo, :phone_number, :email, :password, :password_confirmation　]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
