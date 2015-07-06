class CandidateEnrollment < ActiveRecord::Base
  belongs_to :enrollment
  belongs_to :candidate

  belongs_to :form, polymorphic: true 

  enum :status => [:success, :error, :verify]
end
