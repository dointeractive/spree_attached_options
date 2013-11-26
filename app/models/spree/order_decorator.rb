Spree::Order.class_eval do
  def find_line_items_by_variant(variant)
    line_items.select{ |line_item| line_item.variant_id == variant.id }
  end

  def merge!(order)
    order.line_items.each do |line_item|
      next unless line_item.currency == currency
      current_line_item = self.line_items.find_mathching(line_item)
      if current_line_item
        current_line_item.quantity += line_item.quantity
        current_line_item.save
      else
        line_item.order_id = self.id
        line_item.save
      end
    end
    # So that the destroy doesn't take out line items which may have been re-assigned
    order.line_items.reload
    order.destroy
  end
end
