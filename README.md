# Forwardlytics: the Ruby client

<p align="center">
  <img src="https://s3.amazonaws.com/forwardlytics-assets/logo-color.svg">
</p>

Sends stuff to [Forwardlytics](https://github.com/jipiboily/forwardlytics).

Where are we at? What needs to be done and what's in the pipeline? See [Forawrdlytics on waffle.io][forwardlytics-ruby-on-waffle]

[![Build Status](https://travis-ci.org/jipiboily/forwardlytics-ruby.svg?branch=master)](https://travis-ci.org/jipiboily/forwardlytics-ruby)
[![Stories in Progress](https://badge.waffle.io/jipiboily/forwardlytics-ruby.svg?label=In%20Progress&title=In%20Progress)](http://waffle.io/jipiboily/forwardlytics-ruby)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'forwardlytics'
```

And then execute:

    $ bundle

## How to use it?


### Setup

You need to set both `FORWARDLYTICS_API_KEY` and `FORWARDLYTICS_URL` environment variables.

`FORWARDLYTICS_API_KEY` is the API key you configured on [Forwardlytics](https://github.com/jipiboily/forwardlytics).

`FORWARDLYTICS_URL` is the URL to reach your instance of [Forwardlytics](https://github.com/jipiboily/forwardlytics).

Example:

```
FORWARDLYTICS_API_KEY=123ma
FORWARDLYTICS_URL=http://localhost:3000
```

### Exception handler

Forwardlytics will do its work in threads, so if any exception is raised, it will be silent. We don't want that, so we made an exception handler. Here is how you could configure it in your project:

```ruby
Forwardlytics.exception_handler = -> (ex) {
  puts "Exception in Forwardlytics caught by exception_handler: #{ex}"
  Bugsnag.notify(ex)
}
```

### Dispatch events and identifications

For user identification:

```ruby
Forwardlytics.identify(
  user_id: 42,
  traits: {
    email: 'john@example.com',
    created_at: 1462183499,
    some: 'thing?'
  }
)
```

For event tracking:

```ruby
Forwardlytics.track(
  event: 'Updated Alert',
  user_id: 42,
  properties: {
    some_id: 123,
    some_other_prop: "",
})
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jipiboily/forwardlytics. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[forwardlytics-ruby-on-waffle]: https://waffle.io/jipiboily/forwardlytics-ruby