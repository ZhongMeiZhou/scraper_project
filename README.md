
+# CodeBadges

+Codecademy is a great place to learn coding! Unfortunately, Codecademy's website
+doesn't provide an API to help us monitor our own coding.
+So we made the CodeBadges gem to scrape user achievements from Codecademy!

+Note that we respect Codecademy's `robots.txt`

 ## Usage

 Install it with the following command:
-````ruby
-gem install codebadges
-````
+```
+$ gem install codebadges
+```

-Then in your file:
+Or else put it in your `Gemfile` as:
+```ruby
+gem codebadges
+```
+
+Run it from the command line. For example, to get the achievements of user `chenlizhan`:
+```
+$ codebadges chenlizhan
+```
+
+Or use it from your Ruby code:
 ````ruby
 require "codebadges"
-CodecademyBadges.get_badges(username)
-````
-The argument username is the user's account who you want to check it out!
+lee = CodeBadges::CodecademyBadges.new('chenlizhan')
+badges = lee.badges




# LonelyPlanet Web Scraper Service [![Build Status](https://travis-ci.org/ZhongMeiZhou/scraper_project.svg)](https://travis-ci.org/ZhongMeiZhou/scraper_project)

#ZMZ Taiwan Tours
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
