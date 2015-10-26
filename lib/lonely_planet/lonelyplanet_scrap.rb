require 'oga'
require 'open-uri'
require 'json'

# Module defines LonelyPlanetTours class which handles scraping of lonelyplanet Taiwan tours page
module LonelyPlanetScrape
  class LonelyPlanetTours
    LONELYPLANET_URL = 'http://www.lonelyplanet.com'
    TOUR_RELATIVE_DIR = 'tours'

    TOUR_XPATH_CARD = "//article[contains(@class,'card')]"
    CARD_IMGLINK_XPATH = ".//img[contains(@class,'card__figure__img')]/@src"
    CARD_TITLE_XPATH = './/h1'
    CARD_CONTENT_XPATH = ".//div[contains(@class,'card__content__desc')]//p"
    CARD_LINK_XPATH = ".//div[contains(@class,'card__mask')]//a"
    CARD_LOCATION_XPATH = ".//div[contains(@class,'card__footer__locale')]"
    CARD_PRICE_CURRENCY_XPATH = ".//span[contains(@class,'js-currency')]"
    CARD_PRICE_AMOUNT_XPATH = ".//span[contains(@class,'js-price')]"

    def initialize(country)
      parse_html(country)
    end

    def tours
      @tours ||= extract_tours
    end

    private

    def parse_html(country)
      url = "#{LONELYPLANET_URL}/#{country}/#{TOUR_RELATIVE_DIR}"
      @document = Oga.parse_html(open(url))
    end

    def extract_tours
      result = []
      @document.xpath(TOUR_XPATH_CARD).map do |card|
        element = {}
        element['img'] = card.xpath(CARD_IMGLINK_XPATH).text.strip
        element['title'] = card.xpath(CARD_TITLE_XPATH).text.strip
        element['content'] = card.xpath(CARD_CONTENT_XPATH).text.strip
        element['location'] = card.xpath(CARD_LOCATION_XPATH).text.strip
        element['price_currency'] = card.xpath(CARD_PRICE_CURRENCY_XPATH).text.strip
        element['price'] = card.xpath(CARD_PRICE_AMOUNT_XPATH).text.strip.to_f
        result << element
      end
      result.to_json
    end
  end
end
