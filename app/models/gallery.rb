class Gallery < ActiveRecord::Base
<<<<<<< HEAD
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"	
end	
=======

  has_many :images
  
end
>>>>>>> 9ef6f4b04a0af1acad257d1436aa5187d62f2875
