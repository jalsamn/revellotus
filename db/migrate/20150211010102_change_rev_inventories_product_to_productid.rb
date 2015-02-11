class ChangeRevInventoriesProductToProductid < ActiveRecord::Migration
  def change
    rename_column :rev_inventories, :product, :productid
  end
end
