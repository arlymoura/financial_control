class AddDriveToClient < ActiveRecord::Migration[5.1]
  def change
    add_reference :clients, :drive, index: true, foreign_key: true
  end
end
