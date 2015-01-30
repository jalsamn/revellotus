class ChangeCreatedDateOrderitems < ActiveRecord::Migration
  def change
    change_column :orderitems, :created_date, :date
    change_column :orderitems, :updated_date, :date
  end
end
