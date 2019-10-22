class BudgetsController < ApplicationController
  def create
    @budget = Budget.new
    @budget.amount = params['budget']['amount']
    @budget.month_from = Date.parse("1 #{@selected_month}")
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
end
