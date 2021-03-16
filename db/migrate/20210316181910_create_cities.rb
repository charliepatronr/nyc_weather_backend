class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.integer :weather_id
      t.string :name
      t.string :state
      t.string :country
      t.float :lon
      t.float :lat

      t.timestamps
    end
  end
end
