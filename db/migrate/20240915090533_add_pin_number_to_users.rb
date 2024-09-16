class AddPinNumberToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :pin_number, :integer
  end
end
