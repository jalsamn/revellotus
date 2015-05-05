class ChangeColumnPhxtemplabelsBarcodeToText < ActiveRecord::Migration
  def change
        change_column :phxtemplabels, :barcode, :string
  end
end
