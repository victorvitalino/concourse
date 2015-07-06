class Form::FormMarcaEnrollment < ActiveRecord::Base
  has_one :candidate_enrollment, as: :form
  accepts_nested_attributes_for :candidate_enrollment

  validates :digital_rg, presence: true
end
