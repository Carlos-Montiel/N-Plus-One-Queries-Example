class ChangeDescriptionFromRestaurants < ActiveRecord::Migration[6.1]
  def up
    change_column :restaurants, :description, :text
  end

  def down
    change_column :restaurants, :column_name, :string
  end
end
