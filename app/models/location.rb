class Location < ActiveRecord::Base

  validates :name,:district,:bank_account_number,:bank_name,:branch,:ifsc,:account_holder, :presence => true
  validates :name,:bank_account_number, :uniqueness => true

  has_many :members
  has_many :location_transactions
  has_many :from_muthraiyar_transactions, :foreign_key => :from_location_id, :class_name => "Location"
  has_many :to_muthraiyar_transactions, :foreign_key => :to_location_id, :class_name => "Location"
  
end
