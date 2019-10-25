class TransactionsController < ApplicationController
  def confirm
    @transaction = Transaction.find(params[:id])
    @transaction.approved_at = Time.now
    @transaction.save
  end

  def index
  end

  def next_month
    super
    render action: :change_month
  end

  def prev_month
    super
    render action: :change_month
  end

  def change_month
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

  def create
    # raise
    Transaction.import_dnb(params['transactions']['file'], current_user)
     # flash[:notice] = "Countries uploaded successfully"
    redirect_to inbox_path
  end

  def categorize
    current_user.categorize_all
    redirect_to inbox_path
  end
end


