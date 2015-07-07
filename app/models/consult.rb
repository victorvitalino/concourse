class Consult < ActiveRecord::Base
  belongs_to :project
  belongs_to :content
end
