class ChangecolumnOrderidinProduceOrderItem < ActiveRecord::Migration
  def change
    rename_column :produce_order_items, :order_id, :produce_order_id
  end
end
