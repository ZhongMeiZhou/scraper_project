require 'minitest/autorun'
<<<<<<< HEAD

class ScraperTest
	include 


end

=======
require 'minitest/rg'
require 'yaml'
require 'json'
require_relative './lib/lonelyplanet_scrap.rb'


tours_from_file = YAML.load(File.read('tours.yml'))

describe "Comparing actual data and detecting changes in tours" do

	before do
		data = LonelyPlanetScrape::LonelyPlanetTours.new.get_tours
		@tours_found = JSON.parse(data)


	end

	it 'has the same number of tours' do
		@tours_found.size.must_equal tours_from_file.size
	end

end
>>>>>>> df1dddbaaead0e2966a228bfc2c457b80664ae14
