Spree::ProductsHelper.class_eval do
  def select_options_for_attached_options(product)
    product.group_attached_options_by_option_type.each do |option_type, attached_options|
      option_values = attached_options
        .map(&:option_value)
        .map{ |i| [i.presentation, i.id] }
        .compact

      yield option_type, options_for_select(option_values)
    end
  end
end
