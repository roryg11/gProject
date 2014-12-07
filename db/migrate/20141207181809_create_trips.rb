class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name, null: false
      t.date :date_of_trip
      t.string :location
      t.string :activities
      t.string :trip_type
      t.timestamp
    end
  end
end
