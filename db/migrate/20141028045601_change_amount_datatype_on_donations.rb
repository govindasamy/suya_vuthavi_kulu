class ChangeAmountDatatypeOnDonations < ActiveRecord::Migration
  def up
    change_column :donations, :amount, :decimal, :default => 0
  end

  def down
    change_column :donations, :amount, :integer, :default => nil
  end
end
