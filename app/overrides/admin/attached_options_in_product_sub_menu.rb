Deface::Override.new(virtual_path: "spree/admin/shared/_product_tabs",
                     name: "attached_options_in_product_tabs",
                     insert_bottom: "[data-hook='admin_product_tabs']",
                     erb: %q[
                        <li <%= ' class=active' if current == 'Attached Options' %>>
                          <%= link_to_with_icon 'paperclip', Spree.t(:attached_options), admin_product_attached_options_path(@product) %>
                        </li>
                     ])
