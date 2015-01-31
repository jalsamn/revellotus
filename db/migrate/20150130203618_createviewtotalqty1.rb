class Createviewtotalqty1 < ActiveRecord::Migration
  def change
    execute %Q{
CREATE VIEW groupedtotals AS
       SELECT orderitems.productid, products.name, sum(orderitems.actualqty) AS totalsold
       FROM orderitems, products
       WHERE orderitems.productid = products.revid
       GROUP BY productid
    }
  end
end
