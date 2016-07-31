class Member < ActiveRecord::Base
  validates :name,:father_name,:date_of_birth, :presence => true

  belongs_to :location
  has_many :member_dues
  has_many :location_transactions
  has_one :address,as: :addr

end
