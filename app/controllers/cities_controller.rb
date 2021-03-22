class CitiesController < ApplicationController

    def index 
        cities = City.all
        final =[]

        # creates hash with cities in db and weather api response
        cities.each do |city|
            target = {}
            target["city"] = city.attributes
            api = WeatherApi.new(city.lat, city.lon)
            response = api.query
            if response[:code] != 200
                return render json: response
            else 
                target["city"]["weather"] = response
                final << target
            end 

        end

        render json: final
    end 

    # action hit when creating a new marker on the fronend 
    # calls weather api for that location

    def marker  
        lat = params[:lat]
        lon = params[:lon]
        api = WeatherApi.new(lat, lon)
        response = api.query
        if response[:code] != 200
            payload = {
                error: "Error calling Open Weather API", 
                code: response[:code]
            }
        else 
            payload = response
        end

        render json: payload
    end

end
