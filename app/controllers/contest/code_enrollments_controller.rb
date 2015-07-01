module Contest
  class CodeEnrollmentsController < ApplicationController
    layout 'contest'
    before_action :set_enrollment
    before_action :set_model

    def new
      @code_enrollment = "Code::#{@model}Enrollment".constantize.new
    end

    def create
      @code_enrollment = "Code::#{@model}Enrollment".constantize.new(set_params)
      @code_enrollment.enrollment_id  = @enrollment.id
      @code_enrollment.candidate_id   = current_user.id

      if @code_enrollment.save
        @enrollment_status = StatusEnrollment.new
        @enrollment_status.candidate_id   = current_user.id
        @enrollment_status.enrollment_id  = @code_enrollment.id
      
        if @enrollment_status.save
          redirect_to contest_root_path
        else
          render action: new
        end
      else
        render action: new
      end
    end

    private

    def set_enrollment
      @enrollment = Enrollment.unscoped.find(params[:enrollment_id])
    end

    def set_params
      params.require(:"code_#{@code}_enrollment").permit("Code::#{@model}Enrollment".constantize.new.attributes.keys)
    end

    def set_model
      @code   = @enrollment.code.downcase 
      @model  = @enrollment.code.capitalize
    end
  end
end