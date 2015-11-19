require 'oga'
require 'open-uri'
require 'json'

# Module defines LonelyPlanetTours class which handles scraping of lonelyplanet Taiwan tours page
module LonelyPlanetScrape
  class LonelyPlanetTours
    LONELYPLANET_URL = 'http://www.lonelyplanet.com'
    TOUR_RELATIVE_DIR = 'tours.json'

    TOUR_XPATH_CARD = "//article[contains(@class,'card')]"
    CARD_IMGLINK_XPATH = ".//img[contains(@class,'card__figure__img')]/@src"
    CARD_TITLE_XPATH = './/h1'
    CARD_CONTENT_XPATH = ".//div[contains(@class,'card__content__desc')]//p"
    CARD_LINK_XPATH = ".//div[contains(@class,'card__mask')]//a"
    CARD_LOCATION_XPATH = ".//div[contains(@class,'card__footer__locale')]"
    CARD_PRICE_CURRENCY_XPATH = ".//span[contains(@class,'js-currency')]"
    CARD_PRICE_AMOUNT_XPATH = ".//span[contains(@class,'js-price')]"
    CARD_CATEGORY_XPATH = ".//div[contains(@class,'card__content__context')]"
    MAP_VALUES = {
      "img" => CARD_IMGLINK_XPATH,
      "title" => CARD_TITLE_XPATH,
      "content" => CARD_CONTENT_XPATH,
      "location" => CARD_LOCATION_XPATH,
      "price_currency" => CARD_PRICE_CURRENCY_XPATH,
      "price" => CARD_PRICE_AMOUNT_XPATH,
      "category" => CARD_CATEGORY_XPATH
    }


    def initialize(country)
      @country = country
      parse_html
    end

    def tours(total_elements = 1)
      @total_elements = total_elements
      @tours ||= extract_tours
    end

    private

    def parse_html
      url = "#{LONELYPLANET_URL}/#{@country}/#{TOUR_RELATIVE_DIR}"
      @document = Oga.parse_html(open(url))
    end

    # Return how many pages it has to check
    def total_pages
      page_elements = @document.xpath(TOUR_XPATH_CARD).size 
      total = (@total_elements/page_elements.to_f).ceil
    end


    def extract_tours
      result = []
      (1..total_pages).each do |page|
        @document.xpath(TOUR_XPATH_CARD+"?page=#{page}").map do |card|
          element = {}
          MAP_VALUES.each { |k, v| element[k] = card.xpath(v).text.strip }
          result << element
        end
      end
      result.to_json
    end

  end
end
