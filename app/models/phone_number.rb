class PhoneNumber < ActiveRecord::Base
  attr_accessible :number, :person_id

  belongs_to :person

  validates :number, presence: true
  validates :person_id, presence: true
end
