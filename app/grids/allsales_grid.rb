class AllsalesGrid

  include Datagrid

  scope do
    Orderitem.select("productid, sum(actualqty) as TotalQty").group("productid", "actualqty")
  end

  filter(:productid, :integer)
  filter(:created_date, :date, :range => true)

 
  column(:productid)
  column(:TotalQty)
   column(:finalsold, :header => "Sortable Sum", :order => "TotalQty") do
    self.TotalQty
  end
end
