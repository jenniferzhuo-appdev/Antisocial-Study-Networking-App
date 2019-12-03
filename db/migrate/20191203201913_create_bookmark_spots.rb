class CreateBookmarkSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmark_spots do |t|
      t.integer :favorite_location_id
      t.integer :user_id

      t.timestamps
    end
  end
end
