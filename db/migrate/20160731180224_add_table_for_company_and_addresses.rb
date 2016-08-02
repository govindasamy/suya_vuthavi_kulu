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

    create_table :dues do |t|
      t.date    :date
      t.integer :location_id
      t.decimal :amount, :default=>0

      t.timestamps
    end

    create_table :location_members do |t|
      t.integer :member_id
      t.integer :location_id
      t.boolean :admin, :default=>0
      t.boolean :super_admin, :default=>0

      t.timestamps
    end
  end

end