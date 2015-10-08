require 'oga'
require 'open-uri'
require 'date'

# This module include all the classes that Get data from LonelyPlanet wesite
module LonelyplanetScrap
  # This class gets the news from the website http://www.lonelyplanet.com/news/
  class LonelyPlaneNews
    # Main Constants
    # Please if the test for uri fails replace contant manually
    LONELYPLANET_URL = 'http://www.lonelyplanet.com'
    NEWS_RELATIVE_DIR = 'news'
    
    # XPATH TO EXTRACT DATA
    NEWS_XPATH_CARD = '//article[contains(@class,'post')]'
    CARD_TITLE_XPATH = ''
    CARD_CONTENT_XPATH = ''
    CARD_LINK_XPATH = ''
    CARD_CREATEDBY_XPATH = ''
    CARD_DATE_XPATH = ''

    def initialize
    	parse_html
    end

    def news
    	@news ||= extract_news
    end

    def parse_html
    	url = "#{LONELYPLANET_URL}/#{NEWS_RELATIVE_DIR}"
    	@document = Oga.parse_html(open(url))
    end

    def extract_news

    end

    def fetch
    end

  end
end
