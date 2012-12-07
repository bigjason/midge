# Midge

Midge is a quick and cheap javascript module system for the rails asset pipeline.

**Beta Release: Still a work in progress!**

## Installation

Add this line to your application's Gemfile:

    gem 'midge'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install midge

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

With this setup you create a file called "/app/assets/javascripts/person.midge.js". In this
file attach public functionality onto the `exports` object.

``` javascript
exports.Person = function() {
  this.name = "A guy";
};
```

The output for this after running through the asset pipeline is:

``` javascript
(function(exports) {
  exports.Person = function() {
    this.name = "A guy";
  };
}).call(this, (this.Midge || (this.Midge = {})));
```

So with this in place you can access the `Person` object on the `Midge` namespace.

``` javascript
var guy = new Midge.Person;
```

Simple albeit limited javascript modules.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
