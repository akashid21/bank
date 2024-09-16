class AccountHistory < ApplicationRecord
  belongs_to :accountable, polymorphic: true

  def self.ransackable_associations(auth_object = nil)
    ["accountable"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["accountable_id", "accountable_type", "created_at", "final_balance", "id", "id_value", "initial_balance", "transaction_history", "updated_at"]
  end
end
