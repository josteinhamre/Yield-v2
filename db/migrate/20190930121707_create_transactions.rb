class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.datetime :datetime
      t.integer :amount
      t.string :store
      t.string :address
      t.datetime :approved_at
      t.references :account, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
