class ChangeIntegerLimitInAccount < ActiveRecord::Migration[5.2]
  def change
    change_column :accounts, :number, :integer, limit: 8
  end
end
