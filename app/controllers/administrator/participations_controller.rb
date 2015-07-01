module Administrator
  class ParticipationsController < ApplicationController
    layout 'layouts/administrator_project'
    before_action :set_project
    before_action :set_participation, only: [:edit, :update, :destroy]

    def index
      @participations = @project.participations.unscoped
    end

    def new
      @participation = @project.participations.new
    end

    def create
      @participation = @project.participations.new(set_participation_params)

      if @participation.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def edit

    end

    def update
      if @participation.update(set_participation_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'edit'
      end
    end

    def destroy
      if @participation.destroy
        flash[:success] = t :success
        redirect_to action: 'index'
      end
    end

    private

    def set_participation_params
      params.require(:participation).permit(:name, :description, :start, :end, :status,  :code, :content_mail, :enrollment_id)
    end

    def set_participation
      @participation = @project.participations.find(params[:id]) 
    end

    def set_project
      @project = Project.unscoped.friendly.find(params[:project_id])
    end
  end
end