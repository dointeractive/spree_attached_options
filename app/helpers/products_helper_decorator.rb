module Spree
  ProductsHelper.class_eval do
    def select_tag_for_attached_options(attached_options, options={})
      option_values = attached_options.map do |attached_option| 
        option_value = attached_option.option_value
        [ option_value.presentation, option_value.id ]
      end.compact

      select_tag "products[#{@product.id}][option_value_ids][]", options_for_select(option_values), options
    end
  end
end
