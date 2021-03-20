class CitiesController < ApplicationController

    def index 
        cities = City.all
        # render json: cities, include: '*.*'

        final =[]
        cities.each do |city|
            target = {}
            target["city"] = city.attributes
            api = WeatherApi.new(city)
            response = api.query
            puts response

            if response[:code] != 200
                payload = {
                    error: "Error calling Open Weather API", 
                    code: response[:code]
                }
                return render :json => payload, :status => :bad_request
                # return render json: response
            else 
                target["city"]["weather"] = response
                final << target
            end 

        end
        render json: final

        # call api on load to have all the data and use it on the front end

    end 

    def weather  
        city = City.find(params[:id])

        # render json: city, include: '*.*'
        

        # call external weather api with city id 
        api = WeatherApi.new(city.weather_id)
        target = api.query
        render json: target
        # render json weather id




    end



end
