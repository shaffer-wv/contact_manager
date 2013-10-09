class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  has_many :phone_numbers
  
  validates :first_name, presence: true
  validates :last_name, presence: true
end
