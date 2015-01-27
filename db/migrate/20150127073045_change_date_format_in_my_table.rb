class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def change
    change_column :products, :sku, :bigint
    change_column :products, :barcode, :bigint
  end
end
