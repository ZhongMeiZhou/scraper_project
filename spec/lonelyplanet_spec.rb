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

  describe 'Check for structure changes' do

    it 'should return atleast 10 tours' do
      tours_found.size.must_be :>=, tours_from_file.size
    end

    0.upto(tours_found.length - 1) do |index|
    it 'price should be numeric' do
      tours_found[index]['price'].must_be_kind_of Numeric
    end

    it 'title should be string' do
      tours_found[index]['title'].must_be_instance_of String
    end
   end  
  end
end
