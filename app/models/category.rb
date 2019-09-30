class Category < ApplicationRecord
  belongs_to :user
  belongs_to :icon
  has_many :transactions
  has_many :budgets
end
