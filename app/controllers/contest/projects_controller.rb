class Contest::ProjectsController < ApplicationController
   before_action :set_project, only: [:edit, :show, :update, :destroy]

    def index
      @projects = Project.all
    end

    def new
      @project = Project.new
    end

    def show
      render :layout => 'layouts/contest_project'
    end

    def create
      @project = Project.new(set_project_params)

      if @project.save
        flash[:success] = t :success
        redirect_to [:administrator, @project]
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @project.update(set_project_params)
        flash[:success] = t :success
        redirect_to [:administrator, @project]
      else
        render :edit
      end
    end

    def destroy
    end

    private

    def set_project_params
      params.require(:project).permit(:name, :description, :logo, :header, :footer, :start, :end, :status)
    end

    def set_project
      @project = Project.friendly.find(params[:id])
    end
end
