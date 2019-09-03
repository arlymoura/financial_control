class AddGereToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :genre, :string, default: 'male'
  end
end
