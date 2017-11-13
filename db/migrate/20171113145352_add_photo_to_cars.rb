class AddPhotoToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :photo, :string
  end
end
