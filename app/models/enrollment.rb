class Enrollment < ActiveRecord::Base
  belongs_to :project

  default_scope {where(status: true)}
  validates_presence_of :name, :description, :start, :end
  validates :code, presence: true, uniqueness: true
  validates_date :start, before: :end
  validates :fee_value, presence: true, numericality: true, if: :fee?


  private

  def fee?
    self.fee
  end
end
