class CreateClients < ActiveRecord::Migration[8.0]
  def change
    create_table :clients, id: :uuid do |t|
      t.string :name, null: false
      t.string :tax_identification_number
      t.string :email
      t.monetize :rate

      t.timestamps
    end
  end
end
