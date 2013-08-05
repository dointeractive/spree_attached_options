module Spree
  ProductsHelper.class_eval do
    def select_tag_for_attached_option_type(attached_option_type)
      option_values = attached_option_type.option_values.map{ |ov| [ ov.presentation, ov.id ] }
      select_tag "products[#{@product.master.id}][attached_option_value_ids][]", options_for_select(option_values) 
    end
  end
end
