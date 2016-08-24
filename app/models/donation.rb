class Donation < ActiveRecord::Base
  # validates :name,:donor_id,:amount, :presence => true
require 'csv'
  belongs_to :event

  def Donation.create_donation(params)
    last = Donation.where("donor_id is not null").last
    last_donor_id = last.donor_id.to_s.split("DNR") if !last.nil?
    new_id = last.nil? ? "DNR1" : "DNR" + (last_donor_id[1].to_i + 1).to_s
    donation = Donation.new(params.merge(:donor_id => new_id))
    donation.save
  end
  def self.donation_import(file)
	CSV.parse(File.read(file)).each_with_index do |row,ind|
		if ind!=0
			donation=Donation.create_donation(name:row[1], amount:row[2], refered_by:row[3], date_collected:row[4], description:row[5],event_id: 1)
		end
	end
  end
  def self.expansion_import(file)
	CSV.parse(File.read(file)).each_with_index do |row,ind|
		if ind!=0
			donation=Donation.create_donation(name:row[1], amount:row[2], refered_by:row[3], date_collected:row[4], description:row[5],event_id: 1)
		end
	end
  end
end