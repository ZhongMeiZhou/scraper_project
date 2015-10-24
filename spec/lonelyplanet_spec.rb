require 'minitest/autorun'
# require 'minitest/rg'
require 'oga'
require 'open-uri'
require 'yaml'
require 'json'
require 'vcr'
require 'webmock/minitest'
require './lib/lonely_planet/lonelyplanet_scrap'
require './spec/support/vcr_setup'

tours_from_file = YAML.load(File.read('./spec/tours.yml'))

VCR.use_cassette('taiwan_tours') do
  obj = LonelyPlanetScrape::LonelyPlanetTours.new('taiwan')
  tours_found = JSON.parse(obj.tours) if !obj.tours.nil?

  describe 'Check for difference between returned results and actual data and possibly HTML structure changes' do

    it 'check if the number of taiwan tours has changed' do
      tours_found.size.must_equal tours_from_file.size
    end

    0.upto(tours_from_file.length - 1) do |index|
    it 'check for price changes' do
      tours_from_file[index]['price'].must_equal tours_found[index]['price']
    end

    it 'check for title changes' do
      tours_from_file[index]['title'].must_equal tours_found[index]['title']
    end

    it 'check for description changes' do
      tours_from_file[index]['content'].must_equal tours_found[index]['content']
    end
   end  
  end
end
