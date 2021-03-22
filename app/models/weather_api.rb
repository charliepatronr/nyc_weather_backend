require 'httparty'

# weatherApi class to call the 3rd party api 
# uses lat and lon on initalization

class WeatherApi
    include HTTParty

    BASE_URL="https://api.openweathermap.org/data/2.5/onecall?"
    API_key = ENV["OPEN_WEATHER_API_KEY"]
    API_PARTIAL_URL = "&appid=#{API_key}&units=imperial"

    def query
        request = HTTParty.get(BASE_URL+@lat_lon+API_PARTIAL_URL)
        if request.code != 200 
            puts request.code
            @request_hash = {
                error: "Error calling Open Weather API", 
                code: request.code
            }
        else 
            @request_hash = request.parsed_response
            @request_hash[:code] = request.code
        end 

        @request_hash

    end 

    def initialize(lat, lon)
        @lat_lon= "lat=#{lat}&lon=#{lon}&exclude=minutely,hourly"
    end 


end 
