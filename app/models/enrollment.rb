class Enrollment < ActiveRecord::Base
  belongs_to :project

  default_scope {where(status: true)}
  validates_presence_of :name, :description, :start, :end

  validates :code, presence: true, uniqueness: true
  validates :fee_value, presence: true, numericality: true, if: :fee?

  validates_date :start, before: :end

  has_many :candidate_enrollments
  private

  def fee?
    self.fee
  end
end
