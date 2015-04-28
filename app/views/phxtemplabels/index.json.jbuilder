json.array!(@phxtemplabels) do |phxtemplabel|
  json.extract! phxtemplabel, :id, :barcode
  json.url phxtemplabel_url(phxtemplabel, format: :json)
end
