class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks, id: :uuid do |t|
      t.date :date
      t.references :client, null: false, foreign_key: true, type: :uuid
      t.references :project, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.text :description
      t.integer :status
      t.decimal :estimated_hours
      t.decimal :spent_hours
      t.monetize :rate
      t.references :assigned_to, foreign_key: { to_table: :users }, type: :uuid

      t.timestamps
    end
  end
end
