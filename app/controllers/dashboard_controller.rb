class DashboardController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  respond_to :json

  def dashboard
  end

  def balance_data
    @balance_data = current_user.balance_for_month(@selected_month)
    respond_to do |format|
      format.html { render "balance_data.json" }
      format.js
    end
  end

  def spent_data
    @chart_spent_per_day = []
    end_of_month = (@selected_month_as_date >> 1) - @selected_month_as_date.day
    num_days = end_of_month.day
    (1..num_days).each do |day|
      @chart_spent_per_day << get_day_spent_amount(day).abs
    end
    respond_to do |format|
      format.html { render "spent_data.json" }
      format.js
    end
  end

  def budgeted_data
    @budgeted_data = []
    @budget_cats = []
    @budget_colors = []
    current_user.categories.each do |category|
      unless category.no_cat? || category.income?
        budget = current_user.budgets_for_month(@selected_month_as_date).find_by(category: category)
        if budget
          @budgeted_data << (budget.amount_cents / 100)
        else
          @budgeted_data << 0
        end
        @budget_cats << category.name
        @budget_colors << category.color
      end
    end
    respond_to do |format|
      format.html { render "budgeted_data.json" }
      format.js
    end
  end

  def change_month
  end

  def next_month
    super
    render action: :change_month
  end

  def prev_month
    super
    render action: :change_month
  end

  protected

  def get_day_spent_amount(day)
    transactions = current_user.transactions_for_month_sans_income(@selected_month_as_date)
    amount = 0
    if transactions.length.positive?
      day_trans = transactions.where("extract(day from datetime) = #{day}")
      amount = day_trans.sum(:amount_cents) / 100
    end
    amount
  end
end
