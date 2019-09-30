class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.date :month_from
      t.monetize :amount, currency: { present: false }
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
