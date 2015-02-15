class CreateProduceOrders < ActiveRecord::Migration
  def change
    create_table :produce_orders do |t|
      t.string :vendor
      t.date :orderdate

      t.timestamps
    end
  end
end
