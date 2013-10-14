Deface::Override.new(virtual_path: 'spree/products/_cart_form',
                     name: 'attached_option_at_products_show',
                     insert_before: '[data-hook="inside_product_cart_form"]',
                     partial: 'spree/products/attached_options' )
