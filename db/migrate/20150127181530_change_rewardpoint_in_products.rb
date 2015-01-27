class ChangeRewardpointInProducts < ActiveRecord::Migration
  def change
    change_column :products, :rewardpoint, :int
  end
end
