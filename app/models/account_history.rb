class AccountHistory < ApplicationRecord
  belongs_to :accountable, polymorphic: true
end
