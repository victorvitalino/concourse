module Contest
  class CodeEnrollmentsController < ApplicationController
    layout 'contest'
    def new
      @enrollment = "#{code.humanize}Enrollment".new
    end
  end
end