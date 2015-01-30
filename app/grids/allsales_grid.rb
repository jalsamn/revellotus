class AllsalesGrid

  include Datagrid

  scope do
    Orderitem.select("productid, created_date, sum(actualqty) as tsold, product_name_override").group("productid", "created_date")
  end

  filter(:productid, :integer)
  filter(:created_date, :date, :range => true)

 
  column(:productid)
  column(:product_name_override)
  column(:tsold)
  
  column(:finalsold, :header => "Sortable Sum", :order => "tsold") do
    self.tsold.round(2)
  end
  column(:created_date)
end
