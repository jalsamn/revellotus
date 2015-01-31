class Createviewgroupedsum < ActiveRecord::Migration
  def change
    execute %Q{
      CREATE VIEW groupedqtysold AS
      SELECT productid, sum(actualqty) AS totalsold
        FROM orderitems
        GROUP BY productid
    }

  end
end
