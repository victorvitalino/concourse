module Administrator
  class NavsController < ApplicationController
    layout 'layouts/administrator_project'
    before_action :set_project
    before_action :set_nav, only: [:edit, :update, :destroy]

    def index
      @navs = @project.navs.unscoped
    end

    def new
      @nav = @project.navs.new
    end

    def show
      render :layout => 'layouts/administrator_project'
    end

    def create
      @nav = @project.navs.new(set_nav_params)

      if @nav.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def edit

    end

    def update
      if @nav.update(set_nav_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'edit'
      end
    end

    def destroy
      if @nav.destroy
        flash[:success] = t :success
        redirect_to action: 'index'
      end
    end

    private

    def set_nav_params
      params.require(:nav).permit(:name, :nav_type, :target, :page_id, :url,  :status)
    end

    def set_nav
      @nav = @project.navs.find(params[:id]) 
    end

    def set_project
      @project = Project.unscoped.friendly.find(params[:project_id])
    end
  end
end