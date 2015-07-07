class CandidateEnrollment < ActiveRecord::Base
  belongs_to :enrollment
  belongs_to :candidate

  belongs_to :form, polymorphic: true 

  enum :status => [:waiting, :verify, :success, :error]

  before_create :set_status

  private

  def set_status
    self.status = 0 if Enrollment.find(self.enrollment_id).fee
  end

end
