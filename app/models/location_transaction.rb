class LocationTransaction < ActiveRecord::Base

 # has_many :donations
belongs_to :location
belongs_to :member
end