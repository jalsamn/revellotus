class ChangeColumntemplabelsBarcodeToText < ActiveRecord::Migration
  def change
            change_column :templabels, :barcode, :string
  end
end
