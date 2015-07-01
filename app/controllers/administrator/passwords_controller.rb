module Administrator
  class PasswordsController < ApplicationController
    
    def edit
      @user = User.find(current_user)
    end

    def update
      if @user.update(set_user_params)
      else
      end
    end

    private

    def set_user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

  end
end