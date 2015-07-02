class Page < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :project

  scope :actives, -> { where(status: true)}
  
  #default_scope { where(status: true)}

  validates_presence_of :name, :content
end
