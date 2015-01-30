class AllsalesGrid

  include Datagrid

  scope do
    Orderitem.select("productid, SUM(actualqty) as totalsold" )
  .group("productid").order("totalsold")

  end

  filter(:productid, :integer)

  column(:productid)
  column(:totalsold)
  
end
