require 'httparty'
require 'json'



class WeatherApi
    include HTTParty
     
    # HIDE API KEY 
    # ADD ERROR CATCHING

    # BASE_URL = "https://api.openweathermap.org/data/2.5/weather?"
    BASE_URL="https://api.openweathermap.org/data/2.5/onecall?"
    API_key = ENV["OPEN_WEATHER_API_KEY"]
    # API_key = "no"
    API_PARTIAL_URL = "&appid=#{API_key}&units=imperial"


    def query
        request = HTTParty.get(BASE_URL+@lat_lon+API_PARTIAL_URL)
        if request.code != 200 
            puts request.code
            @request_hash = {
                code: request.code
            }
        else 
            @request_hash = request.parsed_response
            @request_hash[:code] = request.code
        end 

        @request_hash

    end 

    def initialize(city)
        # @search_city =  "id=#{city}"
        @lat_lon= "lat=#{city.lat}&lon=#{city.lon}&exclude=minutely,hourly"
    end 


end 
