require 'oga'
require 'open-uri'
require 'date'
require 'json'

# This module include all the classes that Get data from LonelyPlanet wesite
module LonelyPlanetScrape
  # This class gets the news from the website http://www.lonelyplanet.com/taiwan/Tours
  class LonelyPlanetTours
    # Main Constants
    # Please if the test for uri fails replace contant manually
    LONELYPLANET_URL = 'https://www.lonelyplanet.com'
    TOUR_RELATIVE_DIR = 'taiwan/tours'
    
    # XPATH TO EXTRACT DATA
    TOUR_XPATH_CARD = "//article[contains(@class,'card')]"
    CARD_IMGLINK_XPATH = ".//img[contains(@class,'card__figure__img')]/@src"
    TEST = "//*(@class,'card__figure__img')]"
    CARD_TITLE_XPATH = './/h1'
    CARD_CONTENT_XPATH = ".//div[contains(@class,'card__content__desc')]//p"
    CARD_LINK_XPATH = ".//div[contains(@class,'card__mask')]//a"
    CARD_LOCATION_XPATH = ".//div[contains(@class,'card__footer__locale')]"
    CARD_PRICE_CURRENCY_XPATH = ".//span[contains(@class,'js-currency')]"
    CARD_PRICE_AMOUNT_XPATH = ".//span[contains(@class,'js-price')]"
    

    def initialize
    	parse_html
    end

    def get_tours
    	@tours ||= extract_tours
    end

    def parse_html
    	url = "#{LONELYPLANET_URL}/#{TOUR_RELATIVE_DIR}"
    	@document = Oga.parse_html(open(url))
    end

    def extract_tours
        result = []
        @document.xpath(TOUR_XPATH_CARD).map do |card|
            element = {}
            element['img'] = card.xpath(CARD_IMGLINK_XPATH).text
            element['title'] = card.xpath(CARD_TITLE_XPATH).text.strip
            element['content'] = card.xpath(CARD_CONTENT_XPATH).text.strip
            element['location'] = card.xpath(CARD_LOCATION_XPATH).text
            element['price_currency'] = card.xpath(CARD_PRICE_CURRENCY_XPATH).text
            element['price'] = card.xpath(CARD_PRICE_AMOUNT_XPATH).text
            result.push(element)
        end
        result.to_json
    end
  end
end


