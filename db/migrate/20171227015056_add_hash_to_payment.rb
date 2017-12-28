class AddHashToPayment < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :source_hash, :string
    add_column :payments, :bill_hash, :string
  end
end
