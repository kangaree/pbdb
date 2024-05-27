# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    zen_quotes_service = ZenQuotesService.new
    response = zen_quotes_service.fetch_quotes

    if response.success?
      @quotes = response.parsed_response
    else
      @quotes = []
      flash[:alert] = "Failed to retrieve quotes"
    end
  end
end
