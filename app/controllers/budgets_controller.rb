class BudgetsController < ApplicationController
  def create
    @budget = Budget.new
    @budget.amount = params['budget']['amount']
    @budget.month_from = Date.parse("1 + #{params['budget']['month_from']}")
    @budget.category = Category.find(params['budget']['category'])
    @budget.save!
    get_transactions
  end

  def update
    @budget = Budget.find(params['id'])
    @budget.amount = params['budget']['amount']
    @budget.save!
    get_transactions
  end

  def get_transactions
    sql_query = " \
        extract(month from datetime) = ? \
        AND extract(year from datetime) = ? \
      "
    date = Date.parse("1 #{@selected_month}")
    @transactions = current_user.transactions.where(sql_query, date.month, date.year)
  end
end
