class ModifyviewGroupedrevenuetotals < ActiveRecord::Migration
  def change
     execute %Q{
       CREATE OR REPLACE VIEW groupedrevenuetotals AS
       SELECT orderitems.productid, orderitems.created_date, products.name, sum(orderitems.actualqty)*orderitems.price AS itemrevenue, products.category
       FROM orderitems, products
       WHERE orderitems.productid = products.revid
       GROUP BY orderitems.productid, orderitems.created_date, products.name, products.category, orderitems.price
    }
  end
end
