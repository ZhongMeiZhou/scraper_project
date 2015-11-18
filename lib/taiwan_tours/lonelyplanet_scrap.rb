require 'oga'
require 'open-uri'
require 'json'

# Module defines LonelyPlanetTours class which handles scraping of lonelyplanet Taiwan tours page
module LonelyPlanetScrape
  class LonelyPlanetTours
    LONELYPLANET_URL = 'http://www.lonelyplanet.com'
    TOUR_RELATIVE_DIR = 'taiwan/tours'

    TOUR_XPATH_CARD = "//article[contains(@class,'card')]"
    CARD_IMGLINK_XPATH = ".//img[contains(@class,'card__figure__img')]/@src"
    CARD_TITLE_XPATH = './/h1'
    CARD_CONTENT_XPATH = ".//div[contains(@class,'card__content__desc')]//p"
    CARD_LINK_XPATH = ".//div[contains(@class,'card__mask')]//a"
    CARD_LOCATION_XPATH = ".//div[contains(@class,'card__footer__locale')]"
    CARD_PRICE_CURRENCY_XPATH = ".//span[contains(@class,'js-currency')]"
    CARD_PRICE_AMOUNT_XPATH = ".//span[contains(@class,'js-price')]"
    MAP_VALUES = {
      "img" => CARD_IMGLINK_XPATH,
      "title" => CARD_TITLE_XPATH,
      "content" => CARD_CONTENT_XPATH,
      "location" => CARD_LOCATION_XPATH,
      "price_currency" => CARD_PRICE_CURRENCY_XPATH,
      "price" => CARD_PRICE_AMOUNT_XPATH
    }


    def initialize
      parse_html
    end

    def tours
      @tours ||= extract_tours
    end

    private

    def parse_html
      url = "#{LONELYPLANET_URL}/#{TOUR_RELATIVE_DIR}"
      @document = Oga.parse_html(open(url))
    end

    def extract_tours
      result = []
      @document.xpath(TOUR_XPATH_CARD).map do |card|
        element = {}
        MAP_VALUES.each { |k, v| element[k] = card.xpath(v).text.strip }
        result << element
      end
      result.to_json
    end

  end
end
