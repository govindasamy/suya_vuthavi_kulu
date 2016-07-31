class AddTableForCompanyAndAddresses < ActiveRecord::Migration
  def change
  	create_table :addresses do |t|
      t.references :addr, polymorphic: true, index: true
      t.string :country
      t.string :state
      t.string :district
      t.string :pin
      t.timestamps
    end
    create_table :companies do |t|
      t.string :name
      t.timestamps
    end
  end

end