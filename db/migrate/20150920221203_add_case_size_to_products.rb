class AddCaseSizeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :case_size, :decimal
  end
end
