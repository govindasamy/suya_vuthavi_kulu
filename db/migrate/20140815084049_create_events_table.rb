class CreateEventsTable < ActiveRecord::Migration
  def up
  	create_table :events do |t|
      t.string 		:name
      t.text    	:description
      t.timestamps
    end
    add_column :donations, :event_id, :integer
  end

  def down
  	drop_table :events
  	remove_column :donations, :event_id
  end
end
