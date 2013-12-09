Deface::Override.new(virtual_path: 'spree/products/_cart_form',
                     name: 'add_product_id_parameter',
                     insert_top: '[data-hook="inside_product_cart_form"]',
                     erb: %q[ 
                       <%= hidden_field_tag("products[#{@product.id}][variant][id]", @product.master.id) if @product.variants_and_option_values.empty? %> 
                     ])

Deface::Override.new(virtual_path: 'spree/products/_cart_form',
                     name: 'change_variant_id_parameter',
                     replace: 'erb:contains(\'radio_button_tag "products[#{@product.id}]"\')',
                     erb: %q[ 
                      <%= radio_button_tag "products[#{@product.id}][variant][id]", variant.id, index == 0, 'data-price' => variant.price_in(current_currency).display_price %> 
                     ])

Deface::Override.new(virtual_path: 'spree/products/_cart_form',
                     name: 'change_quantity_parameter',
                     replace: 'erb:contains("number_field_tag (@product.variants_and_option_values.any?")',
                     erb: %q[ 
                       <%= number_field_tag :quantity, 1, :class => 'title', :min => 1 %>
                     ])
