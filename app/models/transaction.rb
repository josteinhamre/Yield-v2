class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category
  monetize :amount_cents
end
