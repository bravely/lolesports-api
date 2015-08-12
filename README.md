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
LolesportsApi::Player.find(330)
=> 
```

#### #reload
blah


## TODO


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
