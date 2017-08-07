class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :cpf
      t.string :rg
      t.string :phone1
      t.string :phone2
      t.string :street
      t.string :number
      t.string :district
      t.string :city

      t.timestamps
    end
  end
end
