class Winner < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :enrollment
end
