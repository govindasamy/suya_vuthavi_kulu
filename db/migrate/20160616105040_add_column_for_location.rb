class AddColumnForLocation < ActiveRecord::Migration
  def up
  	create_table :location_transactions do |t|
      t.date 		:date
      t.integer    	:member_id
      t.integer    	:location_id
      t.decimal     :credit_amount,:default=>0
      t.decimal     :debit_amount,:default=>0
      t.timestamps
    end
    add_column :locations, :bank_account_number, :integer
    add_column :locations, :bank_name, :string
    add_column :locations, :branch, :string
    add_column :locations, :ifsc, :string
    add_column :locations, :account_holder, :string
  end

  def down
  	drop_table :location_transactions
  	remove_column :donations, :event_id
  	remove_column :locations, :bank_account_number
    remove_column :locations, :bank_name
    remove_column :locations, :branch
    remove_column :locations, :ifsc
    remove_column :locations, :account_holder
  end
end
