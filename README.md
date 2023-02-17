# Packs::Rails::Minitest

Adds Rake tasks for testing [packs](https://github.com/rubyatscale/packs) using minitest.

## Usage

Once installed, this gem provides the following Rake tasks:

- `packs:test:prepare` - ran before the next three tasks
- `packs:test` - runs all tests in all packs except system tests
- `packs:test:system` - runs all system tests in all packs
- `packs:test:all` - runs all tests in all packs including system tests

For each pack, the following tasks are also added:

- `packs:test:<pack name>:prepare` - ran before the next three tasks (and as part of `packs:test:prepare`)
- `packs:test:<pack name>` - runs all tests in the pack except system tests
- `packs:test:<pack name>:system` - runs all system tests in the pack
- `packs:test:<pack name>:all` - runs all tests in the pack including system tests

## Installation

Add this line to your application's Gemfile:

```ruby
gem "packs-rails-minitest", group: :development
```

And then execute:
```bash
$ bundle
```

## Contributing

Contributions are welcome, simply create a pull request or file an issue.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
