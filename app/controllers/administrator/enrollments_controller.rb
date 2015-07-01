module Administrator
  class EnrollmentsController < ApplicationController
    layout 'layouts/administrator_project'
    before_action :set_project
    before_action :set_enrollment, only: [:edit, :update, :destroy]

    def index
      @enrollments = @project.enrollments.unscoped
    end

    def new
      @enrollment = @project.enrollments.new
    end

    def create
      @enrollment = @project.enrollments.new(set_enrollment_params)

      if @enrollment.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def edit

    end

    def update
      if @enrollment.update(set_enrollment_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'edit'
      end
    end

    def destroy
      if @enrollment.destroy
        flash[:success] = t :success
        redirect_to action: 'index'
      end
    end

    private

    def set_enrollment_params
      params.require(:enrollment).permit(:name, :description, :start, :end, :status,  :code, :fee, :fee_value, :content_mail)
    end

    def set_enrollment
      @enrollment = @project.enrollments.find(params[:id]) 
    end

    def set_project
      @project = Project.unscoped.friendly.find(params[:project_id])
    end
  end
end