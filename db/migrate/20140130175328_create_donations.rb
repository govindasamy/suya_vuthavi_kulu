class CreateDonations < ActiveRecord::Migration
  def up
  	create_table :donations do |t|
      t.string 		:name
      t.string  	:donor_id
      t.integer 	:amount
      t.string  	:refered_by
      t.datetime 	:date_collected
      t.text    	:description
      t.timestamps
    end
  end

  def down
  	drop_table :donations
  end
end
