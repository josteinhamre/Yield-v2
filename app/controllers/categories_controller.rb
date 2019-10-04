class CategoriesController < ApplicationController

  def index
    get_budgets
    get_transactions
  end

  def prev_month
    @selected_month = (Date.parse("1 #{@selected_month}") << 1).strftime("%B %y")
    session[:selected_month] = @selected_month
    get_budgets
  end

  def next_month
    @selected_month = (Date.parse("1 #{@selected_month}") >> 1).strftime("%B %y")
    session[:selected_month] = @selected_month
    get_budgets
  end

  private

  def get_budgets
    sql_query = " \
        extract(month from month_from) = ? \
        AND extract(year from month_from) = ? \
      "
    month_as_date = Date.parse("1 #{@selected_month}")
    @budgets = current_user.budgets.where(sql_query, month_as_date.month, month_as_date.year)
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
