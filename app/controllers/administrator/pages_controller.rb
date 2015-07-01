module Administrator
  class PagesController < ApplicationController
    layout 'layouts/administrator_project'
    before_action :set_project
    before_action :set_page, only: [:edit, :show, :update, :destroy]


    def index
      @pages = @project.pages.unscoped
    end

    def new
      @page = @project.pages.new
    end

    def create
      @page = @project.pages.new(set_page_params)

      if @page.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def edit
    end

    def update
      if @page.update(set_page_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def destroy
      if @page.destroy
        flash[:success] = t :success
        redirect_to action: 'index'
      end
    end

    private

    def set_project
      @project = Project.unscoped.friendly.find(params[:project_id])
    end

    def set_page
      @page = @project.pages.unscoped.friendly.find(params[:id]) 
    end

    def set_page_params
      params.require(:page).permit(:name, :content, :status)
    end
  end
end