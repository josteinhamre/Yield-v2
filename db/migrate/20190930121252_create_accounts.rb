class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :number
      t.integer :balance
      t.string :bank
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
