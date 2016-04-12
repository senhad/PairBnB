class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :description
      t.string :city
      t.integer :user_id
      t.string :room_type
      t.string :price
      t.integer :accomodates

      t.timestamps null: false
    end
  end
end
