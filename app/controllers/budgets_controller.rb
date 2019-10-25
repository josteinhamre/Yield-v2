class BudgetsController < ApplicationController
  def budget_change
  end

  def create
    @budget = Budget.new
    @budget.amount = params['budget']['amount']
    @budget.month_from = @selected_month_as_date
    @budget.category = Category.find(params['budget']['category'])
    @budget.save!
    render action: :budget_change
  end

  def update
    @budget = Budget.find(params['id'])
    @budget.amount = params['budget']['amount']
    @budget.save!
    render action: :budget_change
  end
end
