class CreateProductrequests < ActiveRecord::Migration
  def change
    create_table :productrequests do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.boolean :fullfilled
      t.string :location

      t.timestamps
    end
  end
end
