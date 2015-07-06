module Contest
  class FormEnrollmentsController < ApplicationController
    layout 'enrollment'
    before_action :set_enrollment
    before_action :set_model

    def new
      @form = "Form::Form#{@model}Enrollment".constantize.new
      @form.build_candidate_enrollment
    end

    def create
      @form = "Form::Form#{@model}Enrollment".constantize.new(set_params)
      @form.build_candidate_enrollment(candidate_id: current_candidate.id, enrollment_id: @enrollment.id)
    
      if @form.save
        redirect_to action: 'show', id: @form
      else
        render action: 'new'
      end
    end

    def show
      @form = current_candidate.candidate_enrollments.find_by_form_id(params[:id])
    end

    private

    def set_enrollment
      @enrollment = Enrollment.unscoped.find(params[:enrollment_id])
    end

    def set_params
      params.require(:"form_form_#{@code}_enrollment").permit("Form::Form#{@model}Enrollment".constantize.new.attributes.keys)
    end

    def set_model
      @code   = @enrollment.code.downcase 
      @model  = @enrollment.code.capitalize
    end
  end
end