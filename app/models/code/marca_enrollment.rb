class Code::MarcaEnrollment < ActiveRecord::Base
  has_one :candidate_enrollment, as: :enrollment
  accepts_nested_attributes_for :candidate_enrollment

  validates_presence_of :name
end
