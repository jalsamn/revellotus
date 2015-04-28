class CreatePhxtemplabels < ActiveRecord::Migration
  def change
    create_table :phxtemplabels do |t|
      t.integer :barcode

      t.timestamps
    end
  end
end
