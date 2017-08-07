class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.decimal :value
      t.date :date
      t.references :bill, foreign_key: true

      t.timestamps
    end
  end
end
