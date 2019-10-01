class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions
  monetize :balance_cents
end
