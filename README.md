SpreeAddOn
==========

Provides fully integrated product add-ons.

Installation
------------

Add spree_add_on to your Gemfile:

```ruby
gem 'spree_add_on'
```

This extension requires the durable_decorator to extend Spree line items in a nice manor. As such,
you'll also need to add it to your Gemfile:

```ruby
gem 'durable_decorator', :github => 'jumph4x/durable_decorator'
```


Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_add_on:install
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_add_on/factories'
```

Copyright (c) 2013 FreeRunning Technologies, released under the New BSD License
