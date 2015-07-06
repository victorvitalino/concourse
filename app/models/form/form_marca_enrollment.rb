class Form::FormMarcaEnrollment < ActiveRecord::Base
  has_one :candidate_enrollment, as: :form
  accepts_nested_attributes_for :candidate_enrollment

  validates :digital_rg, presence: true
  validates :digital_voter, presence: true
  validates :digital_check_voter, presence: true
end
