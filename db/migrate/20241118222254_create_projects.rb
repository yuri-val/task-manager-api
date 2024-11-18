class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects, id: :uuid do |t|
      t.references :client, foreign_key: true, type: :uuid
      t.string :name
      t.text :description
      t.integer :status

      t.timestamps
    end
  end
end
