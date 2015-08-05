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

## Example Usage

#### Finding an object
To find an individual player by their id number:

```
Api::Player.find(id)
```

Currently there is no way to search for a player by any given attributes.

#### Getting child objects

As an unofficial API, certain features either work poorly or barely at all. As a rule of thumb, if you have a parent object(say, a Team), it will only include the `id`s of its children, and maybe other incidental information(such as `name`).

This wrapper currently only does single requests at a time(as I can't tell if things are rate limited or not and would rather not push my luck). However, you can 'fill' an object with its children by using get:

```
$ team = Api::Team.find(304) # Cloud9
$ team.roster.first
=> #<Api::Player:0x007fc7349f96f8
 @bio=nil,
 @contract_expiration=nil,
 @first_name=nil,
 @hometown=nil,
 @id=328,
 @is_starter=1,
 @last_name=nil,
 @name="Balls",
 @photo_url=nil,
 @profile_url=nil,
 @residency=nil,
 @role="Top Lane",
 @role_id=nil,
 @team_id=nil>
$ 
```

## Special Thanks
Thanks [@levi](https://twitter.com/levi) for [this](https://gist.github.com/levi/e7e5e808ac0119e154ce) documentation.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/lolesports-api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
