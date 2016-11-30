class CreateUserLocations < ActiveRecord::Migration
  def change
    create_table :user_locations do |t|
      t.references :user, index: true, foreign_key: true
      t.text :location

      t.timestamps null: false
    end
  end
end
