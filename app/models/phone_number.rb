class PhoneNumber < ActiveRecord::Base
  attr_accessible :number, :contact_id, :contact_type

  belongs_to :contact, polymorphic: true

  validates :number, presence: true
  validates :contact_id, presence: true
end
