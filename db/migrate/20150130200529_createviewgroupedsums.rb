class Createviewgroupedsums < ActiveRecord::Migration
  def change
     execute %Q{
      CREATE VIEW groupedqtysolds AS
      SELECT productid, sum(actualqty) AS totalsold
        FROM orderitems
        GROUP BY productid
    }

  end
end
