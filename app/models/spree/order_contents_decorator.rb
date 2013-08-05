Spree::OrderContents.class_eval do
  def add_with_option_values(variant, option_value_ids, quantity, currency, shipment=nil)
    line_item = @order.find_line_item_by_variant(variant) 
    same_length = option_value_ids.length == line_item.option_values.length if line_item
    equals = option_value_ids.map{ |i| i.to_i }
                             .zip(line_item.option_values.map(&:id))
                             .map{ |a| a[0] == a[1] }
                             .reduce{ |a, i| a && i } if line_item
    if line_item && same_length && equals
      add_to_line_item(line_item, variant, quantity, currency, shipment)
    else
      line_item = add_to_line_item(nil, variant, quantity, currency, shipment)
      option_values = Spree::OptionValue.find(option_value_ids)
      option_values.each  do |option_value|
        line_item.option_values << option_value
      end
    end
  end
end
