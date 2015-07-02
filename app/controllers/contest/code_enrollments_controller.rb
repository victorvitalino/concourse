module Contest
  class CodeEnrollmentsController < ApplicationController
    layout 'contest'
    before_action :set_enrollment
    before_action :set_model

    def new
      @code_enrollment = "Code::#{@model}Enrollment".constantize.new
      @code_enrollment.build_candidate_enrollment
    end

    def create
      @code_enrollment = "Code::#{@model}Enrollment".constantize.new(set_params)
      @code_enrollment.build_candidate_enrollment.candidate_id = current_user.id
      if @code_enrollment.save
       
      else
        render action: 'new'
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