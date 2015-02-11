json.array!(@rinventors) do |rinventor|
  json.extract! rinventor, :id, :update_date, :rproductid, :starting_amount, :added_amount, :threshold, :sold_amount, :actual_amount, :theoretical_ending_inventory
  json.url rinventor_url(rinventor, format: :json)
end
