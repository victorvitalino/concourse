module Contest
  class CodeEnrollmentsController < ApplicationController
    
    def new
      @enrollment = "#{code.humanize}Enrollment".new
    end
  end
end