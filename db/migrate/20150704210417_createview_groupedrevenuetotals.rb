class CreateviewGroupedrevenuetotals < ActiveRecord::Migration
  def change
     execute %Q{
       CREATE VIEW groupedrevenuetotals AS
       SELECT orderitems.productid, orderitems.created_date, products.name, sum((orderitems.actualqty)*(orderitems.price)) AS itemrevenue, products.category
       FROM orderitems, products
       WHERE orderitems.productid = products.revid
       GROUP BY orderitems.productid, orderitems.created_date, products.name, products.category
    }
  end
end
