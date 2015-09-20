class AddCaseUnitToProducts < ActiveRecord::Migration
  def change
    add_column :products, :case_unit, :string
  end
end
