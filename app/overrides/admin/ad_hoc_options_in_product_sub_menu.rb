Deface::Override.new(virtual_path: "spree/admin/shared/_product_tabs",
                     name: "ad_hoc_options_in_product_tabs",
                     insert_bottom: "[data-hook='admin_product_tabs']",
                     erb: %q[ 
                        <li <%= ' class=active' if current == 'Ad Hoc Option Types' %>>
                          <%= link_to Spree.t(:attached_option_types), admin_product_attached_option_types_path(@product) %>
                        </li>
                     ])
