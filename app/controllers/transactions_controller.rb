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
    @transactions = current_user.transactions.where(approved_at: nil)
  end

  def set_category
    @transaction = Transaction.find(params[:id])
    @transaction.category = Category.find(params[:category_id])
    @transaction.save
  end

  private

  def get_transactions
    sql_query = " \
        extract(month from datetime) = ? \
        AND extract(year from datetime) = ? \
      "
    date = Date.parse("1 #{@selected_month}")
    @transactions = current_user.transactions.where(sql_query, date.month, date.year)
  end
end
