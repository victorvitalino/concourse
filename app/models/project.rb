class Project < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged
  
  #default_scope {where(status: true)}  
  
  scope :actives, -> { where(status: true)}
  
  has_many :pages
  has_many :navs
  has_many :enrollments
  has_many :participations
  has_many :candidate_enrollments, :through => :enrollments
    
  mount_uploader :logo, ImageUploader
  mount_uploader :header, ImageUploader
  mount_uploader :footer, ImageUploader

  validates_presence_of :name, :description, :start, :end
end
