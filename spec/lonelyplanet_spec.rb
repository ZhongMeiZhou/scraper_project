require 'minitest/autorun'
# require 'minitest/rg'
require 'oga'
require 'open-uri'
require 'yaml'
require 'json'
require 'vcr'
require 'webmock/minitest'
require './lib/taiwan_tours/lonelyplanet_scrap'
require './spec/support/vcr_setup'


VCR.use_cassette('taiwan_tours_json') do
  obj = LonelyPlanetScrape::LonelyPlanetTours.new
  tours_found = JSON.parse(obj.tours('taiwan')) if !obj.tours('taiwan').nil?

  describe 'Validate structure of result' do

    0.upto(tours_found.length - 1) do |index|
    

    it 'check if title exist and is not empty' do
      
      refute_nil tours_found[index]['title'], "Expect Tittle not nil value for Object #{index}"
      refute_empty tours_found[index]['title'], "Expect Tittle not empty value for Object #{index}"
    end

    it 'check if content exist and is not empty' do
      
      refute_nil tours_found[index]['content'], "Expect description not nil for Object #{index}"
      refute_empty tours_found[index]['content'], "Expect description not value for Object #{index}"
    end

    it 'check if location exist and is not empty' do
      
      refute_nil tours_found[index]['location'], "Expect location not nil for Object #{index}"
      refute_empty tours_found[index]['location'], "Expect location not value for Object #{index}"
    end

    it 'check if price_currency exist and is not empty' do
      
      refute_nil tours_found[index]['price_currency'], "Expect price_currency not nil for Object #{index}"
      refute_empty tours_found[index]['price_currency'], "Expect price_currency not value for Object #{index}"
    end

    it 'check if price exist and is not empty' do
      refute_nil tours_found[index]['price'] , "Expect Price not nil value for Object #{index}"
      refute_empty tours_found[index]['price'] , "Expect Price not empty value for Object #{index}"
    end

    it 'check if category exist and is not empty' do
      refute_nil tours_found[index]['category'] , "Expect Category not nil value for Object #{index}"
      refute_empty tours_found[index]['category'] , "Expect Category not empty value for Object #{index}"
    end

   end  
  end
end
