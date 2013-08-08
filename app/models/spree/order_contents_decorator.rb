Spree::OrderContents.class_eval do
  def add_with_option_values(variant, option_value_ids, quantity, currency, shipment=nil)
    line_item = @order.line_items.find_by_variant_id_and_option_value_ids(variant.id, option_value_ids) 
    if line_item
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
