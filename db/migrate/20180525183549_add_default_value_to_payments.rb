class AddDefaultValueToPayments < ActiveRecord::Migration[5.1]
  def change
    change_column :payments, :value, :decimal, :null => false, :default => 0
  end
end
