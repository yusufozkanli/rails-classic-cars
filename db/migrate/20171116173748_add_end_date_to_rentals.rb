class AddEndDateToRentals < ActiveRecord::Migration[5.1]
  def change
    add_column :rentals, :end_date, :date
    add_column :rentals, :price, :integer
  end
end
