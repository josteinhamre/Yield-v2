class ChangeAmountInTransaction < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :amount
    add_monetize :transactions, :amount, currency: { present: false }
  end
end
