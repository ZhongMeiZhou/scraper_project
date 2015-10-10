require 'minitest/autorun'
require 'yaml'
require 'json'
require './lib/lonelyplanet_scrap'

tours_from_file = YAML.load(File.read('./spec/tours.yml'))
data = LonelyPlanetScrape::LonelyPlanetTours.new.tours
tours_found = JSON.parse(data)

describe 'Compare returned results against actual data' do

  it 'check if the number of taiwan tours has changed' do
    tours_found.size.must_equal tours_from_file.size
  end

  it 'check for changes in structure of results' do
    tours_found[0].key?('price').must_equal true
    tours_found[0].key?('title').must_equal true
    tours_found[0].key?('content').must_equal true
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
