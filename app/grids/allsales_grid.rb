class AllsalesGrid

  include Datagrid

  scope do
    Orderitem.select("productid, SUM(actualqty) as totalsold" )
  .group("productid").order("totalsold")

  end

  filter(:productid, :integer)
  filter(:created_date, :date, :range => true)

  column(:productid)
  column(:totalsold)
  
end
