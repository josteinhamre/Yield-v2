class TransactionsController < ApplicationController
  def confirm
    @transaction = Transaction.find(params[:id])
    @transaction.approved_at = Time.now
    @transaction.save
  end
end
