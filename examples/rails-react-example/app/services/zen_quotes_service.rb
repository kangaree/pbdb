require 'httparty'

class ZenQuotesService
  include HTTParty
  base_uri 'https://zenquotes.io/api'

  def initialize
    @options = { query: {} }
  end

  def fetch_quotes
    self.class.get('/quotes', @options)
  end
end