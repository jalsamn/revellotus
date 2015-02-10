json.array!(@rev_inventories) do |rev_inventory|
  json.extract! rev_inventory, :id, :update_date, :product, :starting_amount, :added_amount, :threshold, :sold_amount, :actual_amount, :theoretical_ending_inventory
  json.url rev_inventory_url(rev_inventory, format: :json)
end
