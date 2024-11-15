class CreateExchangeRates < ActiveRecord::Migration[8.0]
  def change
    create_table :exchange_rates, id: :uuid do |t|
      t.references :currency, null: false, foreign_key: true, type: :string, limit: 8
      t.date :date
      t.decimal :rate

      t.timestamps
    end
  end
end
