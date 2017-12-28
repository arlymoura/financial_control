class AddHashToBill < ActiveRecord::Migration[5.1]
  def change
    add_column :bills, :source_hash, :string
    add_column :bills, :client_hash, :string
  end
end
