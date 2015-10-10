require 'minitest/autorun'
require 'minitest/rg'
require 'yaml'
require 'json'
require './lib/lonelyplanet_scrap'

# Possible tests to add:
# check if data equal to what is in tours.yml (can convert to yaml and compare)

tours_from_file = YAML.load(File.read('./spec/tours.yml'))

describe "Comparing actual data and detecting changes in tours" do

	before do
		data = LonelyPlanetScrape::LonelyPlanetTours.new.tours
		@tours_found = JSON.parse(data)
	end

	it 'has the right number of tours' do
		@tours_found.size.must_equal tours_from_file.size
	end

end