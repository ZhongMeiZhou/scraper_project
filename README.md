

# taiwan_tours [![Gem Version](https://badge.fury.io/rb/taiwan_tours.svg)](https://badge.fury.io/rb/taiwan_tours) [![Build Status](https://travis-ci.org/ZhongMeiZhou/scraper_project.svg)](https://travis-ci.org/ZhongMeiZhou/scraper_project)

 The web scraper service we built provides listings of tour packages from Lonelyplanet based on a specified country. We have bundled this service into the lonely_planet_tours gem for you to use.

 Note that we respect Lonelyplanet's 'robots.txt' file.


## Usage

 Install at the command line:

 ```sh
 $ gem install lonely_planet_tours
 ```

 or include it in your 'Gemfile' as:

 ```ruby
 gem lonely_planet_tours
 ```

## Try it yourself!
 Run it from the command line as:

 ```sh
 $ lonely_planet_tours
 ```

 or include it in your code:

```ruby
require 'lonely_planet_tours'
taiwan =  LonelyPlanetScrape::LonelyPlanetTours.new(country)
tours = taiwan.tours
```

## Want to make improvements?

1. Fork it ( https://github.com/ZhongMeiZhou/scraper_project )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
