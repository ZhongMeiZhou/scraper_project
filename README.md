

# taiwan_tours [![Gem Version](https://badge.fury.io/rb/taiwan_tours.svg)](https://badge.fury.io/rb/taiwan_tours) [![Build Status](https://travis-ci.org/ZhongMeiZhou/scraper_project.svg)](https://travis-ci.org/ZhongMeiZhou/scraper_project)

 The lonelyplanet web scraper service traverses details of Taiwan tour packages in a easiest way and with simple steps.

 Our company entirely respect the privacy policies of our partner Lonelyplanet declared on 'robots.txt' file.


## Gem Usage

 Install our fantastic gem using the following simple command on your command line:

 ```sh
 $ gem install taiwan_tours
 ```

 either, as our gem is published by Rubygems.org you can also include it in your 'Gemfile' as:

 ```ruby
 gem taiwan_tours
 ```

## Try it yourself!
 Run it from the command line as follow:

 ```sh
 $ taiwan_tours
 ```

 or it can also be include it in your own Ruby code with the steps:

```ruby
require 'taiwan_tours'
taiwan =  LonelyPlanetScrape::LonelyPlanetTours.new
tours = taiwan.tours
```

## Want to make improvements?

1. Fork it ( https://github.com/ZhongMeiZhou/scraper_project )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
