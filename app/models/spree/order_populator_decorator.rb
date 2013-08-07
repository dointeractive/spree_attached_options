module Spree
  OrderPopulator.class_eval do
    def populate(from_hash)
      from_hash[:products].each do |product_id, attrs|
        variant = get_variant(attrs[:variant])
        option_value_ids = attrs[:option_value_ids]
        quantity = from_hash[:quantity]
        attempt_cart_add(variant, option_value_ids, quantity)
      end
      valid?
    end

    private 

      def get_variant(variant_attrs)
        Spree::Variant.find(variant_attrs(id))
      end

      def attempt_cart_add(variant_id, option_value_ids, quantity)
        quantity = quantity.to_i
        # 2,147,483,647 is crazy.
        # See issue #2695.
        if quantity > 2_147_483_647
          errors.add(:base, Spree.t(:please_enter_reasonable_quantity, :scope => :order_populator))
          return false
        end

        if quantity > 0
          if check_stock_levels(variant, quantity)
            if option_value_ids
              @order.contents.add_with_option_values(variant, option_value_ids, quantity, currency)
            else
              @order.contents.add(variant, quantity, currency)
            end
          end
        end
      end
  end # end OrderPopulator
end
