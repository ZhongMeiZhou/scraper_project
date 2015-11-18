require 'oga'
require 'open-uri'
require 'json'
require './lib/lonely_planet/lonelyplanet_scrap'
# Test class practice for handling errors and checking for HTML structure changes
# can be used to test functionality before implementing it in Scraper Class
class LonelyPlanetToursTest < LonelyPlanetScrape::LonelyPlanetTours
  # override super class initialize function
  def initialize(country)
    test_parse_html(country)
  end

  def test_tour
    @tours ||= test_html_extraction
  end

  private

  # test connection to external site
  def test_parse_html(country)
    parse_html(country)
  rescue OpenURI::HTTPError => e
    puts "HTTP request error: #{e}"
  end

  # test scraping service and also test for changes in structure of elements being traversed
  def test_html_extraction
    result = []
    fail 'OOPS, root article may have been changed or removed' if @document.xpath(TOUR_XPATH_CARD).text.empty?
    fail 'Title h1 tag may have been changed or removed' if @document.xpath(CARD_TITLE_XPATH).text.empty?
    fail 'Price span tag may have been changed or removed' if @document.xpath(CARD_PRICE_AMOUNT_XPATH).text.empty?
    fail 'Content div tag may have been changed or removed' if @document.xpath(CARD_CONTENT_XPATH).text.empty?

    @document.xpath(TOUR_XPATH_CARD).map do |card|
      element = {}
      element['img'] = card.xpath(CARD_IMGLINK_XPATH).text
      element['title'] = card.xpath(CARD_TITLE_XPATH).text.strip
      element['content'] = card.xpath(CARD_CONTENT_XPATH).text.strip
      element['location'] = card.xpath(CARD_LOCATION_XPATH).text
      element['price_currency'] = card.xpath(CARD_PRICE_CURRENCY_XPATH).text
      element['price'] = card.xpath(CARD_PRICE_AMOUNT_XPATH).text
      result << element
    end
    result.to_json
  rescue StandardError => e
    puts e.message
    puts e.backtrace.inspect
  end
end

test_run = LonelyPlanetToursTest.new('belize')
puts test_run.test_tour
