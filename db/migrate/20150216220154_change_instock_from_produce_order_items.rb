class ChangeInstockFromProduceOrderItems < ActiveRecord::Migration
  def change
    change_column :produce_order_items, :instock, :string
    change_column :produce_order_items, :quantity, :string
  end
end
