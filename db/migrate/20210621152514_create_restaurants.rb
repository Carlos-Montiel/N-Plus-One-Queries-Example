class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.references :owner, null: false, foreign_key: true
      t.string :name
      t.string :restaurant_type
      t.string :description
      t.references :zip_code, null: false, foreign_key: true

      t.timestamps
    end
  end
end
