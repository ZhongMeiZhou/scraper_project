

# lonely_planet_tours [![Gem Version](https://badge.fury.io/rb/lonely_planet_tours.svg)](https://rubygems.org/gems/lonely_planet_tours) [![Build Status](https://travis-ci.org/ZhongMeiZhou/scraper_project.svg)](https://travis-ci.org/ZhongMeiZhou/scraper_project)

 The web scraper service we built provides listings of tour packages from Lonelyplanet based on a specified country. We have bundled this service into the lonely_planet_tours gem for you to use.

 Note that we respect Lonelyplanet's 'robots.txt' file.


## Usage

 Install at the command line:

 ```sh
 $ gem install lonely_planet_tours
 ```

 or include it in your 'Gemfile' as:

 ```ruby
 gem 'lonely_planet_tours'
 ```

## Try it yourself!
 Run it from the command line as:

 ```sh
 $ lonely_planet_tours country_name
 ```

 or include it in your code:

Initialize class
```ruby
require 'taiwan_tours'
require 'lonely_planet_tours'
country =  LonelyPlanetScrape::LonelyPlanetTours.new(country)
```

## Use:

Get tours elements
```ruby
tours = country.tours
```

```

OR

Get tours with specific total elements number. total_elements is optional

```ruby
tours = country.tours(total_elements)
```


## Want to make improvements?

1. Fork it ( https://github.com/ZhongMeiZhou/scraper_project )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
