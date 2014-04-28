Deface::Override.new(virtual_path: 'spree/admin/orders/_shipment_manifest',
                     name: 'attached_options_in_order_shipments',
                     replace: 'erb:contains("variant_options(item.variant)")',
                     erb: %q[
                       <%= text = line_item_name(item.line_item) %>
                       <%= raw('<br>') if text %>
                     ])
