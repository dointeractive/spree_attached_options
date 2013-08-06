Spree::Admin::OrdersHelper.module_eval do
  def item_name(line_item)
    text = []
    text << variant_options(line_item.variant) unless line_item.variant.option_values.empty?
    text << line_item.options_text unless line_item.options_text.blank?
    text = text.join(', ')
    "(#{text})" unless text.empty?
  end
end
