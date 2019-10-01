class ChangeBalanceInAccounts < ActiveRecord::Migration[5.2]
  def change
    remove_column :accounts, :balance
    add_monetize :accounts, :balance, currency: { present: false }
  end
end
