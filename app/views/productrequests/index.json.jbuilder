json.array!(@productrequests) do |productrequest|
  json.extract! productrequest, :id, :name, :email, :phone, :fullfilled, :location
  json.url productrequest_url(productrequest, format: :json)
end
