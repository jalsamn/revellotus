class AddProductidToProducts < ActiveRecord::Migration
  def change
    add_column :products, :productid, :int
  end
end
