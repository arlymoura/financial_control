class CreateDrives < ActiveRecord::Migration[5.1]
  def change
    create_table :drives do |t|
      t.string :name

      t.timestamps
    end
  end
end
