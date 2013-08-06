Deface::Override.new(virtual_path: 'spree/admin/orders/_shipment',
                     name: 'option_values_at_line_item_name',
                     replace_contents: '.item-name',
                     erb: %q[
                       <%= item.variant.product.name %><br><%= item_name(line_item) %>
                     ])
