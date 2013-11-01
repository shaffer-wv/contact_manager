class Person < ActiveRecord::Base
  include Contact
  attr_accessible :first_name, :last_name

  validates :first_name, presence: true
  validates :last_name, presence: true

  def to_s
  	"#{first_name} #{last_name}"
  end
end
