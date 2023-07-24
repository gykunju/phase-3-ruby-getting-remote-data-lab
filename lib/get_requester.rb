# Write your code here
require 'json'
require 'net/http'
require 'open-uri'

class GetRequester
     
    def initialize url
        @url = url
    end

    def get_response_body
        uri = URI.parse(@url)
        response = Net::HTTP.get_response(uri)

        if response.is_a?(Net::HTTPSuccess)
            response.body
        else
            raise "Error: Unable to retrieve data from the provided URL."
        end
    end

    def parse_json
        JSON.parse(self.get_response_body)
    end
end