class Budget < ApplicationRecord
  belongs_to :category
  monetize :amount_cents
end
