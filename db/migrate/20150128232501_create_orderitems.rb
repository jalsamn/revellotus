class CreateOrderitems < ActiveRecord::Migration
  def change
    create_table :orderitems do |t|
      t.decimal :cost
      t.string :created_by
      t.datetime :created_date
      t.integer :rev_id, :limit => 8
      t.integer :order_local_id, :limit => 8
      t.integer :productid, :limit => 8
      t.string :product_name_override
      t.decimal :initial_price
      t.decimal :price
      t.decimal :pure_sales
      t.integer :revquantity
      t.decimal :actualqty
      t.datetime :updated_date

      t.timestamps
    end
  end
end
