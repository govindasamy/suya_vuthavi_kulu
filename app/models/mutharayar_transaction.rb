class MutharayarTransaction < ActiveRecord::Base

  belongs_to :from_location, :foreign_key => :from_location_id, :class_name => "Location"
  belongs_to :to_location, :foreign_key => :to_location_id, :class_name => "Location"

end