# MtgEventInfo

MtgEventInfo is a command line interface tool written in Ruby that allows users to view information about upcoming Magic: The Gathering events from various sources.  Users can choose to display events chronologically according to date, categorically by format, or alphabetically according to location.  After selecting one of those options, users can then choose subsequent options from the submenu(s) to view detailed information about an event.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mtgEventInfo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mtgEventInfo

## Usage

The command line interface provides a menu and detailed instructions for navigation, which is done by entering a number to select one of the listed options or entering a short command such as "list" to re-list options, "back" to return to the previous menu, or "exit" to exit the program.  

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'BusterStatus'/mtgEventInfo. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MtgEventInfo project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'BusterStatus'/mtgEventInfo/blob/master/CODE_OF_CONDUCT.md).
