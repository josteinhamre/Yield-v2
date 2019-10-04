class Budget < ApplicationRecord
  belongs_to :category
  monetize :amount_cents
  validates :month_from, :amount, :category, presence: true
  validate :unique_budget

  private

  def unique_budget
    if new_record?
      sql_query = " \
        extract(month from month_from) = ? \
        AND extract(year from month_from) = ? \
      "
      @budgets = category.budgets.where(sql_query, month_from.month, month_from.year)
      errors.add(:budget, "excists") unless @budgets.empty?
    end
  end
end
