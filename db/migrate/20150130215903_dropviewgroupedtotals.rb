class Dropviewgroupedtotals < ActiveRecord::Migration
  def change
     execute %Q{
        DROP VIEW groupedtotals 
    }
  end
end
