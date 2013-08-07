Deface::Override.new(virtual_path: 'spree/orders/_line_item',
                     name: 'option_values_at_line_item_description',
                     replace: 'code:contains("variant.options_text")',
                     erb: %q[
                       <%= item_name line_item %>
                     ])
