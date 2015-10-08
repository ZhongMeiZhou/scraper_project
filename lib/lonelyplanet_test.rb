require_relative 'lonelyplanet_scrap.rb'
# Testing functionalities
include LonelyPlanetScrape

test_run = LonelyPlanetScrape::LonelyPlanetTours.new
puts test_run.get_tours
