require 'httparty'
require 'json'



class WeatherApi
    include HTTParty
     
    # HIDE API KEY 
    # ADD ERROR CATCHING

    BASE_URL = "https://api.openweathermap.org/data/2.5/weather?"
    APIkey = "086aeada9ac2c944d814b61e05ae3888"
    API_PARTIAL_URL = "&APPID=#{APIkey}&units=metric"


    def query
        request = HTTParty.get(BASE_URL+@search_city+API_PARTIAL_URL)
        @request_hash = request.parsed_response

    end 

    def initialize(city)
        @search_city =  "id=#{city}"
    end 


end 
