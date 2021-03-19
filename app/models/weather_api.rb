require 'httparty'
require 'json'



class WeatherApi
    include HTTParty
     
    # HIDE API KEY 
    # ADD ERROR CATCHING

    # BASE_URL = "https://api.openweathermap.org/data/2.5/weather?"
    BASE_URL="https://api.openweathermap.org/data/2.5/onecall?"
    APIkey = "086aeada9ac2c944d814b61e05ae3888"
    API_PARTIAL_URL = "&appid=#{APIkey}&units=imperial"


    def query
        request = HTTParty.get(BASE_URL+@lat_lon+API_PARTIAL_URL)
        @request_hash = request.parsed_response

    end 

    def initialize(city)
        # @search_city =  "id=#{city}"
        @lat_lon= "lat=#{city.lat}&lon=#{city.lon}&exclude=minutely,hourly"
    end 


end 
