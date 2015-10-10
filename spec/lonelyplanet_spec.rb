require 'minitest/autorun'
require 'yaml'
require 'json'
require './lib/lonelyplanet_scrap'

tours_from_file = YAML.load(File.read('./spec/tours.yml'))

describe 'Compare returned results against actual data' do

  before do
    data = LonelyPlanetScrape::LonelyPlanetTours.new.tours
    @tours_found = JSON.parse(data)
  end

  # May not be necessary if we choose to check the yaml test file against the results
  it 'has the right number of tours' do
    @tours_found.size.must_equal tours_from_file.size
  end

  it 'should contain current tour details' do
    diff = `diff tours_from_file @tours_found.to_yaml`
    diff.must_equal ''
  end
end
