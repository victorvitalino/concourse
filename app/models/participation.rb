class Participation < ActiveRecord::Base
  belongs_to :project
  belongs_to :enrollment

  validates_presence_of :name, :description, :start,  :end, :code, :enrollment_id
  validates_date :start, after: :enrollment_end, if: :enrollment_present?

  private

  def enrollment_end
    enrollment.end
  end

  def enrollment_present?
    self.enrollment.present?
  end
end
