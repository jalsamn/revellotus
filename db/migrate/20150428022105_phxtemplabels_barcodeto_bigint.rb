class PhxtemplabelsBarcodetoBigint < ActiveRecord::Migration
  def change

    change_column :phxtemplabels, :barcode, :bigint


  end
end
