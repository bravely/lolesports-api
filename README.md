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
#### Loading it up

Don't forget to `require 'lolesports-api'`

#### Finding an object

To find an individual player by their id number:

```
LolesportsApi::Player.find(id)
```

Currently there is no way to search for a player by any given attributes.

#### Getting child objects

As an unofficial API, certain features either work poorly or barely at all. As a rule of thumb, if you have a parent object(say, a Team), it will only include the `id`s of its children, and maybe other incidental information(such as `name`).

This wrapper currently only does single requests at a time(as I can't tell if things are rate limited or not and would rather not push my luck).

```
$ team = LolesportsApi::Team.find(304) # Cloud9
$ team.roster.first
=> #<LolesportsApi::Player:0x007f8ee8cbf1f0
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
$ team.roster.first.get
=> #<LolesportsApi::Player:0x007f8ee8cbf1f0
 @bio=
  "One of the best top laners in North America, Balls helped Cloud9 to an astonishing 25-3 record in their debut NA LCS season and is a huge factor in their ongoing success. Balls is also known for being on the of best Rumble players in the world, with a 100% win rate on the Mechanized Menace over the course of the 2014 and 2015 NA LCS. The rest of the top lane field will need to be prepared, because Balls isn’t one to back down from a challenge.",
@contract_expiration="2016-11-21T00:00:00+00:00",
 @first_name="An",
 @hometown="USA",
 @id=0,
 @is_starter=1,
 @last_name=nil,
 @name="Balls",
 @photo_url=
  "http://riot-web-cdn.s3-us-west-1.amazonaws.com/lolesports/s3fs-public/C9-Balls-2015%20Summer.jpg",
 @profile_url="http://na.lolesports.com/node/328",
 @residency=nil,
 @role="Top Lane",
 @role_id="5",
 @team_id=304>
```

From here, calling `team.roster.first.get` will make the API call and populate the object with its attributes.

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
