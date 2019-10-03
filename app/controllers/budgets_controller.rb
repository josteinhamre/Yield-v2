class BudgetsController < ApplicationController
def create
  @budget = Budget.new
  @budget.amount = params['budget[amount]']
  @budget.month_from = params['budget']['month_from']
  @budget.category = Category.find(params['budget']['category'])
  @budget.save!
  p @budget
end
end
