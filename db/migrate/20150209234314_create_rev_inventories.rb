class CreateRevInventories < ActiveRecord::Migration
  def change
    create_table :rev_inventories do |t|
      t.date :update_date
      t.integer :product
      t.decimal :starting_amount
      t.decimal :added_amount
      t.decimal :threshold
      t.decimal :sold_amount
      t.decimal :actual_amount
      t.decimal :theoretical_ending_inventory

      t.timestamps
    end
  end
end
