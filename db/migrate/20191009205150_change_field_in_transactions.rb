class ChangeFieldInTransactions < ActiveRecord::Migration[5.2]
  def change
    rename_column :transactions, :address, :csv_row_id
    rename_column :transactions, :store, :info
  end
end
