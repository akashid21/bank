class CreateAccountHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :account_histories do |t|
      t.integer :initial_balance
      t.integer :final_balance
      t.string :transaction_history
      t.references :accountable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
