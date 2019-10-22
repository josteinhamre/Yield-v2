class Category < ApplicationRecord
  belongs_to :user
  belongs_to :icon
  has_many :transactions
  has_many :budgets
  validates :name, :color, presence: true

  def self.income

  end

  def balance(date)
    p "balance says:"
    p date
    transactions_to_date(date).sum(:amount_cents) + budgets_to_date(date).sum(:amount_cents)
  end

  def budgets_to_date(date)
    filter_by_date(budgets, date, "month_from", "<=")
  end

  def budget_for_month(date)
    filter_by_date(budgets, date, "month_from", "=")
  end

  def transactions_to_date(date)
    filter_by_date(transactions, date, "datetime", "<=")
  end

  def transactions_for_month(date)
    filter_by_date(transactions, date, "datetime", "=")
  end

  def income?
    name == 'Income'
  end

  def no_cat?
    name == 'No Category'
  end
end
