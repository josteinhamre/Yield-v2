class DashboardController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  respond_to :json

  def balance_data
    @balance_data = current_user.balance_for_month(@selected_month)
    respond_to do |format|
      format.html { render "balance_data.json" }
      format.js
    end
  end

  def spent_data
    get_transactions
    @chart_spent_per_day = []
    date = Date.parse("1 #{@selected_month}")
    end_of_month = (date >> 1) - date.day
    num_days = end_of_month.day
    (1..num_days).each do |day|
      @chart_spent_per_day << get_day_spent_amount(day)
    end
    respond_to do |format|
      format.html { render "spent_data.json" }
      format.js
    end
  end

  def current_budgets_month
    sql_query = " \
        extract(month from month_from) = ? \
        AND extract(year from month_from) = ? \
      "
    month_as_date = Date.parse("1 #{@selected_month}")
    current_user.budgets.where(sql_query, month_as_date.month, month_as_date.year)
  end

  def budgeted_data
    current_budgets = current_budgets_month
    @budgeted_data = []
    @budget_cats = []
    current_user.categories.each do |category|
      budget = current_budgets.find_by(category: category)
      if budget
        @budgeted_data << budget.amount_cents
      else
        @budgeted_data << 0
      end
      @budget_cats << category.name
    end
    respond_to do |format|
      format.html { render "budgeted_data.json" }
      format.js
    end
  end

  def next_month
    @selected_month = (Date.parse("1 #{@selected_month}") >> 1).strftime("%B %y")
    session[:selected_month] = @selected_month
    @prev_month = (Date.parse("1 #{@selected_month}") - 2).strftime("%B %y")
  end

  def prev_month
    @selected_month = (Date.parse("1 #{@selected_month}") << 1).strftime("%B %y")
    session[:selected_month] = @selected_month
    @prev_month = (Date.parse("1 #{@selected_month}") - 2).strftime("%B %y")
    render action: :next_month
  end

  protected

  def get_day_spent_amount(day)
    amount = 0
    if @transactions.length.positive?
      day_trans = @transactions.where("extract(day from datetime) = #{day}")
      amount = day_trans.sum(:amount_cents) / 100 if day_trans.length.positive?
    end
    amount
  end
end
