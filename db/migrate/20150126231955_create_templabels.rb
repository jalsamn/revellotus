class CreateTemplabels < ActiveRecord::Migration
  def change
    create_table :templabels do |t|
      t.integer :barcode

      t.timestamps
    end
  end
end
