class Member < ActiveRecord::Base
  validates :name,:father_name,:date_of_birth, :presence => true

  belongs_to :location
  has_many :location_transactions

end
