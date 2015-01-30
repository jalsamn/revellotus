class AddIndexOrderitemsRevid1 < ActiveRecord::Migration
  def change
    add_index :orderitems, :rev_id, unique: true
  end
end
