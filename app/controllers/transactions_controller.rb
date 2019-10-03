class TransactionsController < ApplicationController
  def confirm
    @transaction = Transaction.find(params[:id])
    @transaction.approved_at = Time.now
    @transaction.save
  end

  def inbox
    @transactions = current_user.transactions.where(approved_at: nil)
  end

  def set_category
    @transaction = Transaction.find(params[:id])
    @transaction.category = Category.find(params[:category_id])
    @transaction.save
  end
end
