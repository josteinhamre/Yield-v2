class ChangeBalanceInAccount < ActiveRecord::Migration[5.2]
  def change
    remove_column :account, :balance
    add_monetize :account, :balance, currency: { present: false }
  end
end
