module Administrator
  class CandidatesController < ApplicationController
    
    def index
      @candidates = Candidate.all
    end

  end
end