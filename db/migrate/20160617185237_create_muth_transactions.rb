class CreateMuthTransactions < ActiveRecord::Migration
def up
  	create_table :mutharayar_transactions do |t|
      t.date 		:date
      t.integer    	:from_location_id
      t.integer    	:to_location_id
      t.decimal     :amount,:default=>0
      t.timestamps
    end
  end

  def down
  	drop_table :mutharayar_transactions
  end
end
