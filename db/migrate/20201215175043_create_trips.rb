class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.datetime :date
      t.integer :hiker_id
      t.integer :trail_id

      t.timestamps
    end
  end
end
