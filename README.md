# Lolesports::Api

An easier API wrapper for the [lolesports.com](http://na.lolesports.com) API.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lolesports-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lolesports-api


## Usage
Remember, anywhere you'd like to use it:

```ruby
require 'lolesports-api'
```
### Base Methods

A common rule throughout the API to keep in mind, is that no single command does multiple API calls.

#### .find(id)

Any given `LolesportsApi` class(apart from `LolesportsApi::Play`) has the find method. It returns a new instance of that class, with all related properties and objects.

```ruby
hai = LolesportsApi::Player.find(330)
# => #<LolesportsApi::Player:0x007f9fb3509998 @name="Hai"...>
```

#### #reload
From any given API object with an `@id` attribute, you can use reload to either update the object or load it with all of its endpoint data.

```ruby
hai.reload
# => #<LolesportsApi::Player:0x007f9fb3509998 @name="Hai"...>
```

### Object Specific Methods

#### .all

This only exists for Leagues and Series. Returns an array of all instances of the object.

```ruby
leagues = LolesportsApi::League.all
# => [#<LolesportsApi::League:0x007fd152dfe7f8>, #<LolesportsApi::League:0x00...]
```

## TODO
* `LolesportsApi::Tournament.all`, since the API doesn't currently actually return all tournaments. [API Link](http://na.lolesports.com/api/swagger#!/api/getTournaments)
* `LolesportsApi::Team` list of games. [API Link](http://na.lolesports.com/api/swagger#!/api/getSchedule)
* Other less useful API objects.

## Special Thanks
* Thanks [@levi](https://twitter.com/levi) for [this](https://gist.github.com/levi/e7e5e808ac0119e154ce) documentation.
* And obviously, thanks Riot. <3


## Contributing

1. Fork it ( https://github.com/[my-github-username]/lolesports-api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Write tests.
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request
