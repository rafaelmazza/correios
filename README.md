# Correios

Search for corresponding zipcode address using Correios web service.

## Installation

Add this line to your application's Gemfile:

    gem 'correios'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install correios

## Usage

    zipcode = "01311-000"
    address = Correios::CEP::search(zipcode)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
