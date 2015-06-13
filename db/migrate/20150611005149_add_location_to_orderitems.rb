class AddLocationToOrderitems < ActiveRecord::Migration
  def change
    add_column :orderitems, :location, :integer
  end
end
