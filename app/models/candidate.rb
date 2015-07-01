class Candidate < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  
  belongs_to :state
  belongs_to :city

  enum :sex => [:masculino, :feminino]

  validates_presence_of :name, :cpf, :rg, :sex, :telephone#, :state, :city, :address
  validates :cpf, cpf: true
  validates :telephone, numericality: true
  validates :telephone_optional, numericality: true, allow_blank: true
  validates :cep, numericality: true, allow_blank: true

end
