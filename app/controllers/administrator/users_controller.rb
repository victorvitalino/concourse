module Administrator
  class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :destroy]
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(set_user_params)
      if @user.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def edit
    end

    def update
      if @user.update(set_user_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def destroy
      if @user.destroy
        flash[:success] = t :success
        redirect_to action: index
      end
    end

    private


    def set_user
      @user = User.find(params[:id])
    end

    def set_user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

  end
end