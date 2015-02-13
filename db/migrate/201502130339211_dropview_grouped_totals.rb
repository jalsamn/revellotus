class DropviewGroupedTotals < ActiveRecord::Migration
  def change
     execute %Q{
        DROP VIEW Groupedtotals;
    }
  end
end
