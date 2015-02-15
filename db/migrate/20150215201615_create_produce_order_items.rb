class CreateProduceOrderItems < ActiveRecord::Migration
  def change
    create_table :produce_order_items do |t|
      t.string :producename
      t.decimal :quantity
      t.integer :order_id

      t.timestamps
    end
  end
end
