class CreateZipCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :zip_codes do |t|
      t.references :municipality, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
