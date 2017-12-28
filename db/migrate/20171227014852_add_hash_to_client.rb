class AddHashToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :source_hash, :string
  end
end
