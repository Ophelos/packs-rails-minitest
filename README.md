# Packs::Rails::Minitest

[![Gem Version](https://badge.fury.io/rb/packs-rails-minitest.svg)](https://badge.fury.io/rb/packs-rails-minitest)

Adds Rake tasks for testing [packs](https://github.com/rubyatscale/packs) using minitest.

## Installation

Add the gem to your `Gemfile`:

```shell
bundle add packs-rails-minitest --group development,test
```

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

### Overriding standard Rails test tasks

`rails test` and similar are defined using Thor, meaning they cannot be easily overridden by Rake tasks. There are two
ways to overcome this:

1. Set the environment variables `DEFAULT_TEST` and `DEFAULT_TEST_EXCLUDE` to appropriate globs
2. Create new Rake tasks and use `rake test` instead of `rails test` (recommended)

#### Setting environment variables

The environment variables should be set to values returned by the following Ruby code:

| Variable             | Ruby                                                                                 |
|----------------------|--------------------------------------------------------------------------------------|
| DEFAULT_TEST         | `"{.,#{Packs.all.map(&:relative_path).join(",")}/test/**/*_test.rb}"`                |
| DEFAULT_TEST_EXCLUDE | `"{.,#{Packs.all.map(&:relative_path).join(",")}/test/{system,dummy}/**/*_test.rb}"` |

How you set this up is up to you, there isn't really a standard place. In `application.rb` or `boot.rb` work, just make
sure you only set it if it is not already set, otherwise the Rake tasks defined in this package may not work.

#### Rake task

Appropriate Rake tasks will be defined for you by setting `config.packs_rails_minitest.override_tasks = true` in
your `application.rb`. If you only include this gem in specific environments you will need to set it conditionally e.g.

```ruby
config.packs_rails_minitest.override_tasks = true if Rails.env.development? || Rails.env.test?
```

## Contributing

Contributions are welcome, simply create a pull request or file an issue.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
