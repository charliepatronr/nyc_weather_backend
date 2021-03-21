class CitiesController < ApplicationController

    def index 
        cities = City.all
        # render json: cities, include: '*.*'

        final =[]
        cities.each do |city|
            target = {}
            target["city"] = city.attributes
            api = WeatherApi.new(city.lat, city.lon)
            response = api.query
            puts response

            if response[:code] != 200
                # payload = {
                #     error: "Error calling Open Weather API", 
                #     code: response[:code]
                # }
                # return render :json => payload, :status => :bad_request
                return render json: response
            else 
                target["city"]["weather"] = response
                final << target
            end 

        end
        render json: final

        # call api on load to have all the data and use it on the front end

    end 

    def marker  
        lat = params[:lat]
        lon = params[:lon]
        api = WeatherApi.new(lat, lon)
        response = api.query
        puts response

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
