class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :listing_id
      t.integer :user_id
      t.timestamps null: false
    end
    add_index :purchases, [:listing_id, :user_id], unique: true
  end
end
