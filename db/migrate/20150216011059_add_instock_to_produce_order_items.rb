class AddInstockToProduceOrderItems < ActiveRecord::Migration
  def change
    add_column :produce_order_items, :instock, :decimal
    add_column :produce_order_items, :remark, :text
  end
end
