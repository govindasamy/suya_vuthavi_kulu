class AddColumnForLocationAndMember < ActiveRecord::Migration
  def up
  	add_column :locations, :panjayath, :string
    add_column :members, :job_description, :string
    add_column :members, :current_location, :string
    add_column :members, :aadhaar_id, :string
  end

  def down
  	remove_column :locations, :panjayath
  	remove_column :members, :job_description
    remove_column :members, :current_location
    remove_column :members, :aadhaar_id
  end
end