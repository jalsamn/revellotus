class AllsalesGrid

  include Datagrid

  scope do
    Orderitem.select("productid, created_date, actualqty, product_name_override").group("productid", "actualqty", "created_date", "product_name_override")
  end

  filter(:productid, :integer)
  filter(:created_date, :date, :range => true)

 
  column(:productid)
  column(:product_name_override)
  column(:actualqty)
  
  column(:finalsold, :header => "Sortable Sum", :order => "actualqty") do
    self.actualqty
  end
  column(:created_date)
end
