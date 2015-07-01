class Project < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :pages
  has_many :navs
  has_many :enrollments
  has_many :participations
    
  validates_presence_of :name, :description, :start, :end
end
