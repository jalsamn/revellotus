class Createviewgroupedqtys < ActiveRecord::Migration
  def change
    execute %Q{
       CREATE VIEW groupedqtys AS
       SELECT orderitems.productid, products.name, sum(orderitems.actualqty) AS totalsold
       FROM orderitems, products
       WHERE orderitems.productid = products.revid
       GROUP BY productid
    }
  end
end
