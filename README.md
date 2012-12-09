# Midge

Midge is a quick and cheap [javascript module](http://www.adequatelygood.com/2010/3/JavaScript-Module-Pattern-In-Depth)
system for the rails asset pipeline.

## Installation

Add this line to your application's Gemfile:

``` ruby
gem 'midge'
```

And then execute:

``` console
$ bundle
```

Or install it yourself as:

``` console
$ gem install midge
```

## Usage

First run the install.

``` console
$ rails generate midge:install
```

In the initializer you setup what file extensions will go to what "module".

``` ruby
# /config/initializers/midge.rb

Midge.setup do |config|
  config.jst_processor ".midge_template", "Midge"
  config.js_processor ".midge", "Midge"
end
```

With this setup you can create a file with the extension of ".midge.js" or
".midge.coffee" and it will be module enabled. In the file attach public
functionality onto the `exports` object. For example:

``` javascript
# /app/assets/javascripts/person.midge.js

exports.Person = function() {
  this.name = "A guy";
};
```

The output for this after running through the asset pipeline would be something
like:

``` javascript
(function(exports) {
  exports.Person = function() {
    this.name = "A guy";
  };
}).call(this, (this.Midge || (this.Midge = {})));
```

So with this in place you can access the `Person` object on the `Midge`
namespace.

``` javascript
var guy = new Midge.Person;
```

Voila! Simple albeit limited javascript modules.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
