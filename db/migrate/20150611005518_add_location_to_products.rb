class AddLocationToProducts < ActiveRecord::Migration
  def change
    add_column :products, :location, :integer
  end
end
