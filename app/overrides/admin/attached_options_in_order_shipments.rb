Deface::Override.new(virtual_path: 'spree/admin/orders/_shipment_manifest',
                     name: 'find_line_items_by_variant',
                     replace: 'erb:contains("line_item = order.find_line_item_by_variant")',
                     erb: %q[
                       <% line_items = order.find_line_items_by_variant(item.variant) %>
                     ])

Deface::Override.new(virtual_path: 'spree/admin/orders/_shipment_manifest',
                     name: 'attached_options_in_order_shipments',
                     replace: '.stock-item',
                     erb: %q[
                        <% line_items.each do |line_item| %>
                          <tr class="stock-item" data-item-quantity="<%= item.quantity %>">
                            <td class="item-image"><%= mini_image(item.variant) %></td>
                            <td class="item-name">
                              <%= item.variant.product.name %><br><%= item_name(line_item) %>
                            </td>
                            <td class="item-price align-center"><%= line_item.single_money.to_html %></td>
                            <td class="item-qty-show align-center">
                                <% item.states.each do |state,count| %>
                                  <%= line_item.quantity %> x <%= state.humanize.downcase %>
                                <% end %>
                            </td>
                            <td class="item-total align-center"><%= line_item_shipment_price(line_item, item.quantity).to_html %></td>
                          </tr>
                        <% end %>
                     ])
