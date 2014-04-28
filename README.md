SpreeAttachedOptions
=================

This extension allow you to attach option values directly to the `Product`. This extension is extremely usefull when you have dozens of option values and thus have to create hundreds of variants.

## Compatibility

Master branch is compatible with spree-2-2

## Backend interface

This extension add menu item to the Product edit view.
In "Attached options" menu you can add or remove option values.

![](https://photos-5.dropbox.com/t/0/AABvJMNxahvyo9LopNF8WUQ14325JdXzF_3bMplEJK3N5g/12/68949229/png/1024x768/3/1398704400/0/2/%D0%A1%D0%BA%D1%80%D0%B8%D0%BD%D1%88%D0%BE%D1%82%202014-04-28%2019.56.45.png/KRwx0C_28NVbzxncqDvloSt_7c363OxVoVNQcfC_wcM)


Also in "Order menu" if `line_item` has any attached options they are displayed in shipment manifest view.

![](https://photos-4.dropbox.com/t/0/AACifFC4NhmB4tHqF-__wg8YbJM4JDMHFoHN4ys7TTNEbg/12/68949229/png/1024x768/3/1398704400/0/2/%D0%A1%D0%BA%D1%80%D0%B8%D0%BD%D1%88%D0%BE%D1%82%202014-04-28%2019.59.01.png/PPSLLOIykCqC2W3KQBjKhOrmm3qKbUdUcwdyvVj8810)

## Frontend interface

"Options" block is added to Product view 
![](https://photos-1.dropbox.com/t/0/AADy7sSZv-p-8niqjkLboDfI470oOlae8aMaDm4fvdG0rA/12/68949229/png/1024x768/3/1398708000/0/2/%D0%A1%D0%BA%D1%80%D0%B8%D0%BD%D1%88%D0%BE%D1%82%202014-04-28%2020.00.38.png/j9hcFxpY9jAfB2uzWBiiwftHtauDMR8cSIcBHKRWkTA)

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
