module Spree
  OrderContents.class_eval do
    def add_with_option_values(variant, option_value_ids, quantity, currency, shipment=nil)
      line_item = add_to_order(variant, option_value_ids, quantity, currency, shipment)
      reload_totals
      PromotionHandler::Cart.new(order, line_item).activate
      ItemAdjustments.new(line_item).update
      reload_totals
      line_item
    end

    private

    def add_to_order(variant, option_value_ids, quantity, currency, shipment)
      line_item = order.line_items.find_by_variant_id_and_option_value_ids(variant.id, option_value_ids)

      if line_item
        line_item.target_shipment = shipment
        line_item.quantity += quantity.to_i
        line_item.currency = currency unless currency.nil?
      else
        line_item = order.line_items.build(quantity: quantity, variant: variant)
        line_item.target_shipment = shipment

        if currency
          line_item.currency = currency
          line_item.price    = variant.price_in(currency).amount
        else
          line_item.price    = variant.price
        end
      end

      attach_options(line_item, option_value_ids) if line_item.new_record?
      line_item.save
      line_item
    end

    def attach_options(line_item, option_value_ids)
      option_values = Spree::OptionValue.find(option_value_ids)

      option_values.each do |option_value|
        line_item.option_values << option_value
      end
    end
  end
end
