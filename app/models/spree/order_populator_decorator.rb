module Spree
  OrderPopulator.class_eval do
    def populate(*args)
      attempt_cart_add(*args) if args.any?
      valid?
    end

    private

      def attempt_cart_add(order_params)
        # 2,147,483,647 is crazy.
        # See issue #2695.
        quantity = order_params[:quantity].to_i
        if quantity > 2_147_483_647
          errors.add(:base, Spree.t(:please_enter_reasonable_quantity, :scope => :order_populator))
          return false
        end

        variant = get_variant(order_params)

        if quantity > 0
          if option_value_ids = order_params[:attached_options_ids]
            line_item = @order.contents.add_with_option_values(variant, option_value_ids, quantity, currency)
          else
            line_item = @order.contents.add(variant, quantity, currency)
          end

          unless line_item.valid?
            errors.add(:base, line_item.errors.messages.values.join(" "))
            false
          end
        end
      end

      def get_variant(order_params)
        Variant.find order_params[:variant_id]
      end
  end # end OrderPopulator
end
