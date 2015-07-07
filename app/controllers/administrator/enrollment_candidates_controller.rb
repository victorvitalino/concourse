module Administrator
  class EnrollmentCandidatesController < ApplicationController
    layout 'layouts/administrator_project'
    before_action :set_project

    def index
      @candidates = @project.candidate_enrollments
    end

    def show
      @candidate = @project.candidate_enrollments.find(params[:id])
    end
    
    private

    def set_project
      @project = Project.friendly.find(params[:project_id])
    end
  end
end