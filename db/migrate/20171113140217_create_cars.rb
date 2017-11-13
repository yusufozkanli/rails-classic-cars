class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.integer :year
      t.string :color
      t.integer :price
      t.text :description
      t.string :type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
