Deface::Override.new(virtual_path: 'spree/admin/orders/_shipment',
                     name: 'option_values_at_line_item_name',
                     replace_contents: '.item-name',
                     erb: %q[
                       <% text = [] %>
                       <% text << variant_options(item.variant) unless item.variant.option_values.empty? %>
                       <% text << line_item.options_text unless line_item.options_text.blank? %>
                       <%= item.variant.product.name %><br><%= "(#{ text.join(', ') })" if text.any? %>
                     ])
