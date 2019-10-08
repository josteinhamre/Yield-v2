class TransactionsController < ApplicationController
  def confirm
    @transaction = Transaction.find(params[:id])
    @transaction.approved_at = Time.now
    @transaction.save
  end

  def index
    get_transactions
  end

  def inbox
    unsorted = current_user.transactions.where(approved_at: nil)
    @transactions = (unsorted.sort_by &:datetime).reverse
  end

  def set_category
    @transaction = Transaction.find(params[:id])
    @transaction.category = Category.find(params[:category_id])
    @transaction.save
  end

  def prev_month
    @selected_month = (Date.parse("1 #{@selected_month}") << 1).strftime("%B %y")
    session[:selected_month] = @selected_month
    get_budgets
    get_transactions
  end

  def next_month
    @selected_month = (Date.parse("1 #{@selected_month}") >> 1).strftime("%B %y")
    session[:selected_month] = @selected_month
    get_budgets
    get_transactions
  end
end


