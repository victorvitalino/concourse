module Contest
  class HomeController < ApplicationController
    def index
      @enrollments = Enrollment.all
    end
  end
end