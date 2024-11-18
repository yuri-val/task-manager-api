class CreateClientContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :client_contacts, id: :uuid do |t|
      t.references :client, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.string :email
      t.string :phone
      t.string :position
      t.text :notes
      t.string :tax_identification_number
      t.boolean :main_contact, default: false

      t.timestamps
    end
  end
end
