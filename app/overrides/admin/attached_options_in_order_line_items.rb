Deface::Override.new(virtual_path: 'spree/admin/orders/_line_items',
                     name: 'find_line_items_by_variant',
                     replace_contents: '.line-item-name',
                     erb: %q[
                       <%= item.variant.product.name %>
                       <%= raw('<br>') if text = line_item_name(item) %>
                       <%= text %>
                     ])
