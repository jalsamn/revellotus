class AllsalesGrid

  include Datagrid

  scope do
    Orderitem
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
