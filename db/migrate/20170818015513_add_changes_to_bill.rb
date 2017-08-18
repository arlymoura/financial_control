class AddChangesToBill < ActiveRecord::Migration[5.1]
  def change
    add_column :bills, :end_date, :date
    add_column :bills, :quant, :integer
  end
end
