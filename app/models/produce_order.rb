class ProduceOrder < ActiveRecord::Base
  has_many :produce_order_items
  
  def produce_order_items_attr=(produce_order_items_attr)
    produce_order_items_attr.each do |attributes|
    produce_order_items.build(attributes)
  end
  end


end
