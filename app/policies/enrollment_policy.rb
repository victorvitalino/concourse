class EnrollmentPolicy < ApplicationPolicy

  def unique?(enrollment_id)

    #!user.candidate_enrollments.where(enrollment_id: enrollment_id).present?
  end

end