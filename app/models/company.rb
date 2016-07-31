class Company < ActiveRecord::Base
	
  has_one :address ,as: :addr


end