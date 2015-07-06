class RegistrationsController < Devise::RegistrationsController
  layout 'contest'

  before_filter :configure_permitted_parameters

  protected

  # my custom fields are :name, :heard_how
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :telephone, :telephone_optional, :cpf, :rg,
               :sex, :address,:email, :password, :password_confirmation,
               :city_id, :state_id)
    end
  
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :telephone, :telephone_optional, :cpf,
               :rg, :sex, :address,:email, :password, :password_confirmation,
               :city_id, :state_id, :current_password)
    end
  end



end