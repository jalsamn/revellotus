class CreateviewGroupedTotals < ActiveRecord::Migration
  def change
     execute %Q{
       CREATE VIEW groupedtotals AS
       SELECT orderitems.productid, orderitems.created_date, products.name, sum(orderitems.actualqty) AS totalsold, products.category
       FROM orderitems, products
       WHERE orderitems.productid = products.revid
       GROUP BY orderitems.productid, orderitems.created_date, products.name, products.category
    }
  end
end
