module Contest
  class EnrollmentsController < ApplicationController
    def index
      @enrollments = StatusEnrollment.where(candidate_id: current_user.id)
    end

  end
end