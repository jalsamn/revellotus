class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :sku
      t.integer :barcode
      t.string :category
      t.string :subcategory
      t.decimal :rewardpoint
      t.decimal :cost
      t.boolean :active

      t.timestamps
    end
  end
end
