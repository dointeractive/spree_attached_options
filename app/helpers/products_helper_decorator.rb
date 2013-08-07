module Spree
  ProductsHelper.class_eval do
    def select_tag_for_attached_option_type(attached_option_type, options={})
      option_values = attached_option_type.option_values.map{ |ov| [ ov.presentation, ov.id ] }
      select_tag "products[#{@product.master.id}][option_value_ids][]", options_for_select(option_values), options
    end
  end
end
