Deface::Override.new(virtual_path: 'spree/products/_cart_form',
                     name: 'attached_option_types_at_products_show',
                     insert_after: '[data-hook="inside_product_cart_form"]',
                     partial: 'spree/products/attached_option_types' )
