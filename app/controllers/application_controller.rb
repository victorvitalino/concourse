class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :set_layout

  include Pundit
  
  private

  def set_layout
    controller_path.split('/')[0] if !devise_controller?
  end
end
