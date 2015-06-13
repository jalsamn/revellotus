class ChangeLocationFormatInProducts < ActiveRecord::Migration
  def change
    change_column :products, :location, :string
  end
end
