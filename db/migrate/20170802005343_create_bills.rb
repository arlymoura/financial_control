class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.decimal :value
      t.text :note
      t.integer :status
      t.date :date
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
