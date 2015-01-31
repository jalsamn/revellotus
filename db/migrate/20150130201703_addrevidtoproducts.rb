class Addrevidtoproducts < ActiveRecord::Migration
  def change
    add_column :products, :revid, :bigint
  end
end
