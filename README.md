# EnvUtilsRuby

Easily Get Environment Variables. This is the ruby-like version of [env-utils](https://github.com/BolajiOlajide/env-utils)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'env_utils'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install env_utils

## get_env_var

Gets an environment variable. This returns nil if the environment variable isn't detected.

```ruby
include EnvUtils

get_env_var(env_var_name, options)
```

### Options

- `options.is_boolean` - Forces the value to be a boolean

```ruby
# returns true if the variable is 'true' else it returns false
shouldAcceptCoins = get_env_var('SHOULD_ACCEPT_COINS', { boolean: true })
```

- `options.is_array` - If your env variable is a comma separated string you can get back an array instead.

```ruby
# PORTS='8080,9000,3000'
PORTS = get_env_var('PORTS', { isArray: true }) # returns ['8080', '9000', '3000'];
```

In the event that the variable is separated by something other than a comma, you can define the separator using `options.separator`.

```ruby
PORTS = '8080&9000&3000'
PORTS = get_env_var('PORTS', { isArray: true, separator: '&' }) # returns ['8080', '9000', '3000'];
```

- `options.dev_default` - used to specify a development-environment-only fallback for the variable. If the variable is nil, the `devDefault` is returned in it's stead.
  This only applies when `ENV['RAILS_ENV'] is 'development'`. Any other value of `RAILS_ENV` will not regard this option

```ruby
PORT = get_env_var('PORT', { dev_default: '1234' })
# if ENV["PORT"] is not set, the value of PORT will be `1234`
```

- `options.default` - used to specify a default fallback for the variable. If the variable is nil, the `default` is returned in it's stead, dev_default overides default in development environment

```ruby
PORT = get_env_var('PORT', { default: '1234' })
# if ENV["PORT"] is not set, the value of PORT will be `1234`
```

- `options.is_integer` - used to convert numeric-like variables into integer. Note: This will return 0 if value is not numeric-like.

```ruby
# if ENV["PORT"] = '8080'
PORT = get_env_var('PORT', { is_integer: true }) # returns 8080

#  if ENV["PORT"] = 'smash' - returns 0
PORT = get_env_var('PORT', { is_integer: true }) # returns 0
```

- `options.is_float` - used to convert numeric-like variables into float. Note: This will return 0.0 if value is not a number

```ruby
# if ENV["PORT"] = '8080.98'
PORT = get_env_var('PORT', { is_float: true }) # returns 8080.98

#  if ENV["PORT"] = 'smash' - returns 0.0
PORT = get_env_var('PORT', { is_float: true }) # returns 0.0
```

#### Utility Functions

`env-utils` exports some utility functions that return `variables` in a certain type. This is just casting some variables to its type

```ruby

# You can make use of the utility functions and they return the appropriate types

get_string_env('SENTRY_DSN') # will always return a string | undefined
```

N.B All utility functions have exactly the same signature as the `get_env_var` function.

- `ENV` returns an environment variable as a string
- `get_array_env` returns an environment variable as an array
- `get_bool_env` returns an environment variable as a boolean
- `get_integer_env` returns an environment variable as an integer
- `get_float_env` returns an environment variable as a float

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/danielshow/env_utils. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/env_utils/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Env::Utils::Ruby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/danielshow/env_utils/blob/master/CODE_OF_CONDUCT.md).

## Credits

- [Bolaji Olajide](https://github.com/BolajiOlajide)
