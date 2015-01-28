class ChangeBarcodeTemplabels < ActiveRecord::Migration
  def change
    change_column :templabels, :barcode, :bigint
  end
end
