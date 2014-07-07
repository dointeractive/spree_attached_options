SpreeAttachedOptions
=================

This extension allow you to attach option values directly to the `Product`. It's extremely usefull when you have dozens of option values and thus have to create hundreds of variants.

## Compatibility

Master branch is compatible with spree-2-2

## Backend interface

This extension adds menu item to the "Product edit view" and displays attached options in "Order edit view".
In "Product edit" menu you can add or remove option values.  

![](https://raw.githubusercontent.com/dointeractive/spree_attached_options/spree-2-2/doc/backend_01.png)


In "Order edit" menu you can see which options customer chose when ordered a product.  
![](https://raw.githubusercontent.com/dointeractive/spree_attached_options/spree-2-2/doc/backend_02.png)

## Frontend interface

"Options" block is added to "Product show view" so customers can order a product with different options.  
![](https://raw.githubusercontent.com/dointeractive/spree_attached_options/spree-2-2/doc/frontend_01.png)

Installation
------------

Add spree_attached_options to your Gemfile:

```ruby
gem 'spree_attached_options', github: 'dointeractive/spree_attached_options'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_attached_options:install
```

Copyright (c) 2014 "Do Interactive", released under the MIT License
