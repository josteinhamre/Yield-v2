class Budget < ApplicationRecord
  belongs_to :category
  monetize :amount_cents
  validates :month_from, :amount, :category, presence: true
  validate :unique_budget

  private

  def unique_budget
    sql_query = " \
        extract(month from month_from) = ? \
        AND extract(year from month_from) = ? \
      "
    @budgets = category.budgets.where(sql_query, month_from.month, month_from.year)
    return @budgets.empty?
  end
end
