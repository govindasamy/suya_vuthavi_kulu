class Address < ActiveRecord::Base
	
  belongs_to :addr , polymorphic: true

end