module Spree
  OrderPopulator.class_eval do
    def populate(from_hash)
      @from_hash = from_hash
      @from_hash[:products].each do |product_id, attrs|
        attempt_cart_add(product_id)
      end
      valid?
    end

    private 

      def get_variant(product_id)
        Spree::Variant.find(@from_hash[:products][product_id][:variant][:id])
      end
      
      def get_option_value_ids(product_id)
        @from_hash[:products][product_id][:option_value_ids]
      end

      def quantity
        @from_hash[:quantity].to_i
      end

      def attempt_cart_add(product_id)
        # 2,147,483,647 is crazy.
        # See issue #2695.
        if quantity > 2_147_483_647
          errors.add(:base, Spree.t(:please_enter_reasonable_quantity, :scope => :order_populator))
          return false
        end

        variant = get_variant(product_id)

        if quantity > 0
          if check_stock_levels(variant, quantity)
            option_value_ids = get_option_value_ids(product_id)
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
