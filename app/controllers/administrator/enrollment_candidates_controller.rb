module Administrator
  class EnrollmentCandidatesController < ApplicationController
    layout 'layouts/administrator_project'
    before_action :set_project

    def index
    end

    private

    def set_project
      @project = Project.friendly.find(params[:project_id])
    end
  end
end