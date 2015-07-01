class Page < ActiveRecord::Base
  belongs_to :project
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name, :content
end
