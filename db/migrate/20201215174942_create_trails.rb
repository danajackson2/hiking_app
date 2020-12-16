class CreateTrails < ActiveRecord::Migration[6.1]
  def change
    create_table :trails do |t|
      t.string :name
      t.integer :length
      t.string :location

      t.timestamps
    end
  end
end
