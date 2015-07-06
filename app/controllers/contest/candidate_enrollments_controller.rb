module Contest
  class CandidateEnrollmentsController < ApplicationController
    layout 'contest'
    
    def index
      @candidate_enrollments  = CandidateEnrollment.where(candidate_id: current_candidate.id) 
    end

    def show
      @candidate_enrollment  = current_candidate.candidate_enrollments.find(params[:id]) 
    end
  end
end