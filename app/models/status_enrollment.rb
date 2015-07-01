class StatusEnrollment < ActiveRecord::Base
  belongs_to :enrollment
  belongs_to :candidate
end
