class ChangeFullfilledinProductrequests < ActiveRecord::Migration
  def change
    remove_column :productrequests, :fullfilled
    add_column :productrequests, :status, :string
  end
end
