class ChangeBillStatusToString < ActiveRecord::Migration[5.1]
  def change
    change_column :bills, :status, :string
  end
end
