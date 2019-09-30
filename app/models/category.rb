class Category < ApplicationRecord
  belongs_to :user
  belongs_to :icon
  has_many :transactions
end
