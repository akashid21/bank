class AddBalanceToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :balance, :integer
  end
end
