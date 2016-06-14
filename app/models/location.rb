class Location < ActiveRecord::Base

  validates :name,:district, :presence => true
  validates :name, :uniqueness => true

  has_many :members
  
end