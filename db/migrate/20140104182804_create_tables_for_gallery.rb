class CreateTablesForGallery < ActiveRecord::Migration
  def up
    create_table :galleries do |t|
      t.column :name , :string 
      t.column :description , :text
      t.timestamps
    end
    create_table :images do |t|
      t.column :gallery_id , :integer
      t.column :image , :string 
      t.timestamps
  	end
  end

  def down
  	drop_table :galleries
  	drop_table :images
  end	

end
