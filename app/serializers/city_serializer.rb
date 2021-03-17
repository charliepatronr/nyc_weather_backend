class CitySerializer < ActiveModel::Serializer

    attributes :id, :weather_id, :name, :state, :country, :lon, :lat

end 