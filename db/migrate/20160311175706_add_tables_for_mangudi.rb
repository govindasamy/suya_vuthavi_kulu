class AddTablesForMangudi < ActiveRecord::Migration
  def up
    create_table :locations do |t|
      t.column :name , :string 
      t.column :district , :string

      t.timestamps
    end

    create_table :members do |t|
      t.column :location_id , :integer 
      t.column :name , :string
      t.column :father_name, :string
      t.column :phone, :integer
      t.column :date_of_birth, :date
      t.column :profession, :string
   
       
      t.timestamps
  	end

  end

  def down
  	drop_table :locations
  	drop_table :members
  end	
end


# name, father_name, panchayat, 
# ooratchi mandram, ontriyam,mavatta ooratchi, thogudhi, mp thoguthi