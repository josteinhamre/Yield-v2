class Budget < ApplicationRecord
  belongs_to :category
  monetize :amount_cents
  validates :month_from, :amount, :category, presence: true
  validate :unique_budget

  private

  def unique_budget
    if new_record?
      errors.add(:budget, "excists") unless filter_by_month(category.budgets, month_from, "month_from").empty?
    end
  end
end
