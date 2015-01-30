class AllsalesGrid

  include Datagrid

  scope do
    Orderitem.select("productid, actualqty, product_name_override").group("productid", "actualqty", "product_name_override")
  end

  filter(:productid, :integer)
  filter(:created_date, :date, :range => true)

 
  column(:productid)
  column(:product_name_override)
  column(:totalsold, 'sum(actualqty)')
  
  column(:finalsold, :header => "Sortable Sum", :order => "totalsold") do
    self.totalsold
  end
end
