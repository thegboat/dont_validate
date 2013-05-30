# DontValidate

Remove earlier defined validations from ActiveModel inheritors.

Use when updating the source file is not feasible

Add this line to your application's Gemfile:

    gem 'dont_validate'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dont_validate

## Usage

  The inverse of validates

    validates :some_attribute, :presence => true

    dont_validate :some_attribute, :presence => true

    validates :some_attribute, :format => {:with => /\d+/}

    dont_validate :some_attribute, :format => true




## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
