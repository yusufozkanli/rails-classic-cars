class AddAddressToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :address, :string
  end
end
