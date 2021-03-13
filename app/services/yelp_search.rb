require "json"
require "http"

class YelpSearch

    API_HOST = "https://api.yelp.com"
    SEARCH_PATH = "/v3/businesses/search"

    attr_reader :categories, :location

    def initialize(categories = "food", location = "30309")
        @categories = categories
        @location = location
    end

    def call
        url = "#{API_HOST}#{SEARCH_PATH}"
        params = {
            categories: categories,
            location: location,
          }
        response = HTTP.auth("Bearer #{ENV['API_KEY']}").get(url, params: params)
        response.parse
    end 

end 