class AllsalesGrid

  include Datagrid

  scope do
    Orderitem.group(:productid)
  end

  filter(:productid, :integer)
  filter(:created_date, :date, :range => true)

 
  column(:productid)
  column(:product_name_override)
  column(:totalsold, 'sum(actualqty)')
  
  column(:finalsold, :header => "Sortable Sum", :order => "totalsold") do
    self.totalsold.round(2)
  end
  column(:created_date)
end
