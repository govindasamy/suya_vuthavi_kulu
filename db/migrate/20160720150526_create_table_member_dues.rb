class CreateTableMemberDues < ActiveRecord::Migration
  def up
  	create_table :member_dues do |t|
      t.date 		:date
      t.date 		:due_date
      t.integer    	:location_id
      t.integer    	:member_id
      t.decimal     :amount,:default=>0
      t.timestamps
    end
  end

  def down
  	drop_table :member_dues
  end
end
