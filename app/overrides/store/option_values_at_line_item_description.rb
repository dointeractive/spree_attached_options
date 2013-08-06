Deface::Override.new(virtual_path: 'spree/orders/_line_item',
                     name: 'option_values_at_line_item_description',
                     insert_after: 'code:contains("variant.options_text")',
                     erb: %q[
                       <%= line_item.options_text %>
                     ])
