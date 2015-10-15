# LonelyPlanet Web Scraper Service [![Build Status](https://travis-ci.org/ZhongMeiZhou/scraper_project.svg)](https://travis-ci.org/ZhongMeiZhou/scraper_project)

#ZMZTaiwanTours
 The lonelyplanet web scraper service traverses details of Taiwan tour packages in a easiest way and with simple steps.

 Our company entirely respect the privacy policies of our partner Lonelyplanet declare on 'robots.txt' file.

## Installation

Execute the command below to install all dependencies:

    $ bundle

Or install the gems yourself listed in the Gemfile:

    $ gem install oga
    $ gem install json
    $ gem install minitest

## Service usage

Please run `bin/taiwan_tours` for you to explore tour packages

## Testing

Please run `ruby spec/lonelyplanet_spec.rb` to run a series of tests on the returned results

## Want to make improvements?

1. Fork it ( https://github.com/ZhongMeiZhou/scraper_project )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Gem Usage

 Install our fantastic gem using the following simple command on your command line:
     $ gem install ZMZTaiwanTours

 either, as our gem is published by Rubygems.org you can also include it in your 'Gemfile' as:
     ```ruby
     $ gem ZMZTaiwanTours
     ```
## Try it!
 Run it from the command line as follow:
     ```
     $ ZMZTaiwanTours
     ```
 or it can also be include it in your own Ruby code with the steps:
     ```ruby
     require 'ZMZTaiwanTours'
     taiwan =  LonelyPlanetScrape::LonelyPlanetTours.new
     tours = taiwan.tours
     ``` 
