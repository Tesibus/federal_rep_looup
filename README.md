# FederalRepLookup

This is a tool for looking up Federal Congresspeople based on zipcode they represent.

## Installation

This can be installed by adding the gem to you Gemfil

```bash
gem 'federal_rep_lookup'
```

## Usage

To get a congressperson, do the following:

```ruby
result = FederalRepLookup.lookup(zipcode: '70818')

rep = result.first
rep.name
#=> 'Garret Graves'
rep.party
#=> 'Republican'
rep.state
#=> 'LA'
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
