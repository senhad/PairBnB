class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :listing_id
      t.date :from
      t.date :to
      t.timestamps null: false
    end
  end
end
