class AddAccountToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :account_number, :integer
  end
end
